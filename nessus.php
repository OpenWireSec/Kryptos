<?php
require_once 'core/Init.php';
$nessus = new Nessus();

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
                $nessus->parse_xml_file($newname);
                unlink($newname);
            }

            else echo "Error";
        }

        else echo "Error";
    }

    else echo "Error";
}
?>
