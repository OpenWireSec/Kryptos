<?php
require_once 'core/Init.php';


function loop_host(&$report_host)
{
    //global $final, $host_addr;
    foreach ($report_host AS $report_item)
    {
        if (isset($report_item['name']) && $report_item['name'] == 'HostProperties')
            loop_property($report_item);

        if (isset($report_item['name']) && $report_item['name'] == 'ReportItem')
            loop_item($report_item);
    }
}

function loop_property(&$report_item)
{
    global $final, $host_addr;

    foreach ($report_item AS $host_property)
    {
        if (isset($host_property['name']) && $host_property['name'] == 'tag')
            $final[$host_addr]['properties'][$host_property['attributes']['name']] = $host_property['value'];
    }
}

function loop_item(&$report_item)
{
    global $final, $host_addr, $vuln_id;
    foreach ($report_item AS $curr_item)
    {
        if (count($curr_item) == 7) // new vuln
        {
            $vuln_id += 1;
            $vuln = array();
            $vuln['port'] = $curr_item['port'];
            $vuln['service'] = $curr_item['svc_name'];
            $vuln['protocol'] = $curr_item['protocol'];
            $vuln['severity'] = $curr_item['severity'];
            $vuln['id'] = $curr_item['pluginID'];
            $vuln['name'] = $curr_item['pluginName'];
            $vuln['family'] = $curr_item['pluginFamily'];

            if (!isset($final[$host_addr]['vulns'])) // 1st vuln of this host
            $final[$host_addr]['vulns'] = array();

            $final[$host_addr]['vulns'][$vuln_id] = $vuln;
        }

        elseif (count($curr_item) == 2) // add a param to the current vuln
        {
            if (isset($final[$host_addr]['vulns'][$vuln_id][$curr_item['name']]))
                $final[$host_addr]['vulns'][$vuln_id][$curr_item['name']] .= "\n". $curr_item['value'];
            else
                $final[$host_addr]['vulns'][$vuln_id][$curr_item['name']] = $curr_item['value'];
        }
    }
}

function parse_xml_file($filename)
{
    global $final, $host_addr;
    $parser = new Parser();
    $full = $parser->nessusArray($filename);
    $report = $parser->nessusValue($full, 'NessusClientData_v2/Report');

    $final = array();
    $host_addr = '';
    $vuln_id = -1;
    $final['report_name'] = $report['attributes']['name'];

    foreach ($report AS $report_host) {
        if (isset($report_host['name']) && $report_host['name'] == 'ReportHost')
        {
            $host_addr = $report_host['attributes']['name'];
            $final[$host_addr] = array();
            loop_host($report_host);
        }
    }

    render();
}

function match_filters(&$vuln)
{
    $whitelist = array(
        'High' => 'on',
        'Medium' => 'on',
        'Low' => 'on',
        'None' => 'on'
    );
    $whitelist_sevr = array_keys($whitelist);
    $ms_filter = $_POST['ms'];


    $is_ms = (preg_match("/MS[0-9]{2}-[0-9]{3}: /", substr($vuln['name'], 0, 10)) > 0) ? true : false;

    if (!isset($vuln['risk_factor']) or
        (isset($vuln['risk_factor']) and
            !in_array($vuln['risk_factor'], $whitelist_sevr)))

        return false;

    if ((!$is_ms and $ms_filter == 'only_ms') or
        ($is_ms and $ms_filter == 'no_ms'))

        return false;

    return true;
}

function get_num_vulns(&$vulns)
{
    $ret = 0;

    foreach ($vulns as $v) if (match_filters($v)) $ret++;

    return $ret;
}

function render()
{
    global $final;

    $all_cols = array('port', 'service', 'protocol', 'name', 'risk_factor', 'severity', 'synopsis', 'description', 'id', 'family',
        'exploit_available', 'cve', 'bid', 'xref');
    $whitelistCols = array(
        'port' => 'on',
        'service' => 'on',
        'protocol' => 'on',
        'name' => 'on',
        'risk_factor' => 'on',
        'severity' => 'on',
        'synopsis' => 'on',
        'description' => 'on',
        'id' => 'on',
        'family' => 'on',
        'exploit_available' => 'on',
        'cve' => 'on',
        'bid' => 'on',
        'xref' => 'on'
    );
    $whitelist_cols = array_keys($whitelistCols);

    echo "<html><head><title>PHP Nessus Parser</title>";
    echo "<style>* { font-family: Verdana, Tahoma, Arial, sans-serif; font-size: 10px; }</style></head><body>";
    echo '<h3>Report: '. $final['report_name'] .'</h3>';
    unset($final['report_name']);

    echo '<table border="1" cellpadding="5"><tr style="font-weight: bold; background-color: #aaa;"><td>Machine Details</td>';

    foreach ($all_cols AS $col)
        if (in_array($col, $whitelist_cols))
            echo '<td>'. ucwords(str_replace('_', ' ', $col)) .'</td>';

    echo '</tr>';

    echo "<pre>";
    var_dump($final);

    foreach ($final AS $ip => $host)
    {
        $host_done = 0;
        $props = &$host['properties'];
        $rowspan = get_num_vulns($host['vulns']);

        foreach ($host['vulns'] AS $vuln)
        {
            if (!match_filters($vuln))
                continue ;

            echo '<tr>';

            if ($host_done == 0)
            {
                echo '<td valign="top" colspan="1" rowspan="'. $rowspan .'">';

                echo '<b>'. $ip .'</b><br>';
                echo '<i>';
                if (isset($props['host-fqdn'])) {
                    echo "FQDN: ".$props['host-fqdn'];
                }
                if(isset($props['netbios-name'])) {
                    echo "Netbios Name: ".$props['netbios-name'];
                }
                echo '</i><br>';
                if (isset($props['operating-system'])) {
                    echo "Operating System: ".$props['operating-system'];
                }
                $host_done = 1;
            }

            foreach ($all_cols AS $col)
                if (in_array($col, $whitelist_cols))
                    echo "<td valign=\"top\">".
                        (empty($vuln[$col]) ? '&nbsp;' :
                            nl2br(htmlentities($vuln[$col]))) .
                        "</td>\n";

            echo "</tr>\n";
        }
        flush();
    }
    echo '</table></body></html>';
}

if (!isset($_POST['submit']))
{
    echo "<html><head><title>PHP Nessus Parser</title>";
    echo "<style>* { font-family: Verdana, Tahoma, Arial, sans-serif; font-size: 10px; }</style></head><body>";

    echo '<h3>PHP Nessus Parser</h3>
	<form enctype="multipart/form-data" action="" method="post">
	<input type="hidden" name="MAX_FILE_SIZE" value="10485760" />
	Choose a file to upload (*.nessus, < 10M):<br>
	<input name="uploaded_file" type="file" /><br><br>

	Choose fields to display:<br>
	<table border="0">
	<tr><td><input type="checkbox" name="opt[port]" />Port</td>
	<td><input type="checkbox" name="opt[service]" />Service</td>
	<td><input type="checkbox" name="opt[protocol]" />Protocol</td>
	<td><input type="checkbox" name="opt[name]" checked="checked" />Vuln name</td></tr>

	<tr><td><input type="checkbox" name="opt[risk_factor]" checked="checked" />Risk Factor</td>
	<td><input type="checkbox" name="opt[severity]" />Severity</td>
	<td><input type="checkbox" name="opt[synopsis]" />Synopsis</td>
	<td><input type="checkbox" name="opt[description]" />Description</td></tr>

	<tr><td><input type="checkbox" name="opt[family]" />Vuln Family</td></tr>

	<tr><td><input type="checkbox" name="opt[exploit_available]" />Is exploit available ?</td></tr>

	<tr><td><input type="checkbox" name="opt[cve]" checked="checked" />CVE identifiers</td>
	<td><input type="checkbox" name="opt[bid]" />BID identifiers</td>
	<td><input type="checkbox" name="opt[xref]" />OSVDB identifiers</td></tr></table><br>

	Choose risk factors to display:<br>
	<input type="checkbox" name="sev[Critical]" checked="checked" />Critical
	<input type="checkbox" name="sev[High]" />High
	<input type="checkbox" name="sev[Medium]" />Medium
	<input type="checkbox" name="sev[Low]" />Low
	<input type="checkbox" name="sev[None]" />None<br><br>

	Vulnerability filter:<br>
	<input type="radio" name="ms" value="all" checked="checked" />Show all vulns
	<input type="radio" name="ms" value="only_ms" />Show only MS vulns
	<input type="radio" name="ms" value="no_ms" />Show all but MS vulns<br><br>

	<input type="submit" name="submit" value="Upload" /></form>';
    echo "</body></html>";
}

else
{
    if (!empty($_FILES['uploaded_file']) && $_FILES['uploaded_file']['error'] == 0)
    {
        $filename = basename($_FILES['uploaded_file']['name']);
        $ext = substr($filename, strrpos($filename, '.') + 1);
        if ($ext == 'nessus' && empty($_FILES['uploaded_files']['type']) && $_FILES['uploaded_file']['size'] < 10485760)
        {
            $newname = dirname(__FILE__) .'/uploads/'. $filename;

            if (file_exists($newname)) unlink($newname);

            if (!file_exists($newname) and move_uploaded_file($_FILES['uploaded_file']['tmp_name'], $newname))
            {
                parse_xml_file($newname);
                unlink($newname);
            }

            else echo "Error";
        }

        else echo "Error";
    }

    else echo "Error";
}
?>
