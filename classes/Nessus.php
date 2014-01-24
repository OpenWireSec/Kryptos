<?php

class Nessus {
    function nessusValue($__xml_tree, $__tag_path)
    {
        $tmp_arr =& $__xml_tree;
        $tag_path = explode('/', $__tag_path);
        foreach($tag_path as $tag_name)
        {
            $res = false;
            foreach($tmp_arr as $key => $node)
            {
                if(is_int($key) && $node['name'] == $tag_name)
                {
                    $tmp_arr = $node;
                    $res = true;
                    break;
                }
            }
            if(!$res)
                return false;
        }
        return $tmp_arr;
    }

    function nessusArray($__url)
    {
        $xml_values = array();
        $contents = file_get_contents($__url);
        $parser = xml_parser_create('');
        if(!$parser)
            return false;

        xml_parser_set_option($parser, XML_OPTION_TARGET_ENCODING, 'UTF-8');
        xml_parser_set_option($parser, XML_OPTION_CASE_FOLDING, 0);
        xml_parser_set_option($parser, XML_OPTION_SKIP_WHITE, 1);
        xml_parse_into_struct($parser, trim($contents), $xml_values);
        xml_parser_free($parser);
        if (!$xml_values)
            return array();

        $xml_array = array();
        $last_tag_ar =& $xml_array;
        $parents = array();
        $last_counter_in_tag = array(1=>0);
        foreach ($xml_values as $data)
        {
            switch($data['type'])
            {
                case 'open':
                    $last_counter_in_tag[$data['level']+1] = 0;
                    $new_tag = array('name' => $data['tag']);
                    if(isset($data['attributes']))
                        $new_tag['attributes'] = $data['attributes'];
                    if(isset($data['value']) && trim($data['value']))
                        $new_tag['value'] = trim($data['value']);
                    $last_tag_ar[$last_counter_in_tag[$data['level']]] = $new_tag;
                    $parents[$data['level']] =& $last_tag_ar;
                    $last_tag_ar =& $last_tag_ar[$last_counter_in_tag[$data['level']]++];
                    break;
                case 'complete':
                    $new_tag = array('name' => $data['tag']);
                    if(isset($data['attributes']))
                        $new_tag['attributes'] = $data['attributes'];
                    if(isset($data['value']) && trim($data['value']))
                        $new_tag['value'] = trim($data['value']);

                    $last_count = count($last_tag_ar)-1;
                    $last_tag_ar[$last_counter_in_tag[$data['level']]++] = $new_tag;
                    break;
                case 'close':
                    $last_tag_ar =& $parents[$data['level']];
                    break;
                default:
                    break;
            };
        }
        return $xml_array;
    }

    function loop_host(&$report_host)
    {
        foreach ($report_host AS $report_item)
        {
            if (isset($report_item['name']) && $report_item['name'] == 'HostProperties')
                $this->loop_property($report_item);

            if (isset($report_item['name']) && $report_item['name'] == 'ReportItem')
                $this->loop_item($report_item);
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
        $full = $this->nessusArray($filename);
        $report = $this->nessusValue($full, 'NessusClientData_v2/Report');

        $final = array();
        $host_addr = '';
        $vuln_id = -1;
        //$final['report_name'] = $report['attributes']['name'];

        foreach ($report AS $report_host) {
            if (isset($report_host['name']) && $report_host['name'] == 'ReportHost')
            {
                $host_addr = $report_host['attributes']['name'];
                $final[$host_addr] = array();
                $this->loop_host($report_host);
            }
        }
        $this->render();
    }

    function match_filters(&$vuln)
    {
        $whitelistSevr = array(
            'High' => 'on',
            'Medium' => 'on',
            'Low' => 'on',
            'None' => 'on'
        );
        $whitelist_sevr = array_keys($whitelistSevr);
        $ms_filter = "all";

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

        foreach ($vulns as $v) if ($this->match_filters($v)) $ret++;

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

        foreach ($final AS $ip => $host)
        {
            $host_done = 0;
            $props = &$host['properties'];
            $rowspan = $this->get_num_vulns($host['vulns']);

            foreach ($host['vulns'] AS $vuln)
            {
                if (!$this->match_filters($vuln))
                    continue ;


                if ($host_done == 0)
                {
                    echo $ip;
                    echo isset($props['host-fqdn'])."<br>";
                    echo isset($props['netbios-name'])."<br>";
                    echo isset($props['operating-system'])."<br>";
                    $host_done = 1;
                }

                echo $vuln['port']."<br>";
                echo $vuln['service']."<br>";
                echo $vuln['protocol']."<br>";
                echo $vuln['severity']."<br>";
                echo $vuln['id']."<br>";
                echo $vuln['name']."<br>";
                echo $vuln['family']."<br>";
                echo $vuln['description']."<br>";
                echo $vuln['fname']."<br>";
                echo $vuln['plugin_name']."<br>";
                echo $vuln['risk_factor']."<br>";
                echo $vuln['synopsis']."<br>";
                echo $vuln['plugin_output']."<br><br>";


            }
            flush();
        }
    }
}