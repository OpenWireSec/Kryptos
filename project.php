<?php
require_once 'core/Init.php';
$user = new User();

if (isset($_GET["name"])) {
    $project = htmlentities($_GET['name']);
}
if (!isset($project) || empty($_GET['name'])) {
    Redirect::to('index.php');
}

if($user->isLoggedIn()) {
    $activeScans = DB::getInstance()->getAssoc("SELECT DISTINCT host FROM hosts WHERE project = ? ORDER BY INET_ATON(host) ASC", array($project));
    foreach($activeScans->results() as $results) {
        $active[] = $results;
    }

    if(!empty($active)) {
        foreach($active as $ips) {
            foreach($ips as $ip) {
                $getPorts = DB::getInstance()->getAssoc("SELECT DISTINCT port FROM hosts WHERE host = ?", array($ip));
                foreach($getPorts->results() as $results) {
                    $ports[$ip][] = $results;
                }
            }
        }
    }

    $getNotes = DB::getInstance()->getAssoc("SELECT * FROM projectnotes WHERE projectname = ?", array($project));
    foreach($getNotes->results() as $results) {
        $notes[] = $results;
    }

    $getChallenge = DB::getInstance()->getAssoc("SELECT * FROM challenges WHERE project = ?", array($project));
    foreach($getChallenge->results() as $results) {
        $challenges[] = $results;
    }

    if(!empty($notes)) {
        $notesID = $notes[0]['id'];
    }

    $getOwner = DB::getInstance()->getAssoc("SELECT startedBy FROM hosts WHERE project = ?", array($project));
    foreach($getOwner->results() as $results) {
        $owner[] = $results;
    }

    if(!empty($owner)) {
        $ownerName = $owner[0]['startedBy'];
    }

    if(Input::exists()) {
        if(isset($_POST['add'])) {
            $port = DB::getInstance()->insertAssoc('hosts', array(
                'host' => Input::get('host'),
                'project' => Input::get('projectname'),
                'startedby' => $ownerName
            ));
            Redirect::to('project.php?name='.htmlentities($project));
        }

        if(isset($_POST['addMultiple'])) {
            if($_FILES['uploadedfile']['size'] != 0) {
                $filename = basename($_FILES['uploadedfile']['name']);
                $ext = substr($filename, strrpos($filename, '.') + 1);

                if ($ext == 'nessus') {
                    $newname = dirname(__FILE__) .'/uploads/'. $filename;
                    if (file_exists($newname)) unlink($newname);
                    if (!file_exists($newname) and move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $newname))
                    {
                        $nessus = new Nessus();
                        $nessus->parse_xml_file($newname);
                        unlink($newname);
                    }

                }
                else if($_FILES['uploadedfile']['type'] == 'text/xml') {
                    $target_path = "queue/";
                    $target_path = $target_path . basename( $_FILES['uploadedfile']['name']);

                    if(move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $target_path)) {
                        $parser = new Parser();
                        $parser->nmapParse('queue/'.$_FILES['uploadedfile']['name']);

                        $hosts = $parser->nmap();
                        foreach($hosts as $ips => $ip) {
                            foreach($ip as $index => $ports) {
                                foreach($ports as $port => $services) {
                                    $hosts = DB::getInstance()->insertAssoc('hosts', array(
                                        'host' => $ips,
                                        'port' => $port,
                                        'protocol' => $services['Protocol'],
                                        'state' => $services['State'],
                                        'reason' => $services['Reason'],
                                        'name' => $services['Name'],
                                        'product' => $services['Product'],
                                        'version' => $services['Version'],
                                        'project' => htmlentities(Input::get('projectname')),
                                        'startedby' => $user->data()->username
                                    ));
                                }
                            }
                        }
                    } else {
                        echo "There was an error uploading the file, please try again!";
                    }
                } else {
                    echo "Invalid File Type";
                }
                Redirect::to('project.php?name='.htmlentities($project));
            }
        }

        if(isset($_POST['addChallenge'])) {
            $port = DB::getInstance()->insertAssoc('challenges', array(
                'challengeName' => Input::get('challenge'),
                'project' => Input::get('projectname'),
                'type' => Input::get('type')
            ));
            Redirect::to('project.php?name='.htmlentities($project));
        }

        if(isset($_POST['delete'])) {
            DB::getInstance()->delete('hosts', array('project', '=', $project));
            DB::getInstance()->delete('hostnotes', array('project', '=', $project));
            DB::getInstance()->delete('projectnotes', array('projectname', '=', $project));
            Redirect::to('index.php');
        }
        if(isset($_POST['editNotes'])) {
            if(!empty($notes)) {
                $editHost = DB::getInstance()->update('projectnotes', $notesID, array(
                    'projectname' => $project,
                    'notes' => Input::get('notes')
                ));
            } else {
                $addHost = DB::getInstance()->insertAssoc('projectnotes', array(
                    'projectname' => $project,
                    'notes' => Input::get('notes')
                ));
            }
            Redirect::to('project.php?name='.htmlentities($project));
        }
    }


    $page = new Page;
    $page->setTitle('Dashboard');
    $page->startBody();
    ?>

    <div class="panel-body">

        <ol class="breadcrumb">
            <li>
                <a href="index.php">
                    <i class="entypo-folder"></i>
                    Dashboard
                </a>
            </li>
            <li class="active"><?php echo $project;?></li>
        </ol>

    </div>

    <div class="row">
        <div class="col-md-12">

            <div class="panel panel-invert" data-collapsed="0"><!-- setting the attribute data-collapsed="1" will collapse the panel -->

                <!-- panel head -->
                <div class="panel-heading">
                    <div class="panel-title">Project Notes</div>

                    <div class="panel-options">
                        <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                        <a href="#" data-rel="close"><i class="entypo-cancel"></i></a>
                    </div>
                </div>

                <!-- panel body -->
                <div class="panel-body">
                    <form role="form" id="form2" method="post" class="validate" action="">
                        <textarea name="notes" id="editor" placeholder="Project Notes" style="background-color: transparent; border: none; width: 100%; height: 200px; min-height: 200px;color: #fff; resize: none;"><?php if(!empty($notes)) { foreach($notes as $note) { echo $note['notes']; } } ?></textarea>
                </div>
            </div>
            <button type="submit" name="editNotes" class="btn btn-success">Edit Notes</button>
            </form><br><br>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-primary">

                <div class="panel-heading">
                    <div class="panel-title">Add New Challenge</div>

                    <div class="panel-options">
                        <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                        <a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
                    </div>
                </div>

                <div class="panel-body">

                    <form role="form" id="form1" method="post" class="validate" action="">

                        <div class="form-group">
                            <label class="control-label">Challenge Name</label>
                            <input type="text" class="form-control" name="challenge" id="challenge" data-validate="required" data-message-required="Challenge Name is Required" placeholder="Challenge Name" />
                        </div>
                        <div class="form-group">
                            <label class="control-label">Challenge Type</label>
                            <input type="text" class="form-control" name="type" id="type" data-validate="required" data-message-required="Challenge Type is Required" placeholder="Challenge Type" />
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="projectname" value="<?php echo $project;?>" />
                            <button type="submit" name="addChallenge" class="btn btn-success">Add Challenge</button>
                            <button type="reset" class="btn">Reset</button>
                        </div>

                    </form>

                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="panel-title">Active Challenges</div>

                    <div class="panel-options">
                        <a href="#" data-rel="collapse"><i class="entypo-down-open" data-toggle="tooltip" data-placement="top" title="" data-original-title="Collapse"></i></a>
                        <a href="#" data-rel="reload"><i class="entypo-arrows-ccw" data-toggle="tooltip" data-placement="top" title="" data-original-title="Refresh"></i></a>
                    </div>
                </div>

                <table class="table table-bordered table-responsive">
                    <thead>
                    <tr>
                        <th>Challenge Name</th>
                        <th>Type</th>
                    </tr>
                    </thead>

                    <tbody>
                    <?php

                    if(!empty($challenges)) {
                        foreach($challenges as $challenge) {
                            echo '<tr>';
                            echo '<td><a href="challengeinfo.php?project='.$project.'&challenge='.$challenge['challengeName'].'">'.$challenge['challengeName'].'</a></td>';
                            echo '<td>';
                            echo $challenge['type'];
                            echo '</td>';
                            echo '</tr>';
                        }
                    } else {
                        echo '<tr><td></td></tr>';
                    }?>
                    </tbody>
                </table>
            </div>
        </div>


        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="panel-title">Add New Hosts</div>

                    <div class="panel-options">
                        <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                        <a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
                    </div>
                </div>

                <div class="panel-body">

                    <form role="form" id="form1" method="post" class="validate" action="">

                        <div class="form-group">
                            <label class="control-label">Host</label>
                            <input type="text" class="form-control" name="host" id="host" data-validate="required" data-message-required="Host is Required" placeholder="Host" />
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="projectname" value="<?php echo $project;?>" />
                            <button type="submit" name="add" class="btn btn-success">Add Host</button>
                            <button type="reset" class="btn">Reset</button>
                        </div>

                    </form>
                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="panel-title">Add Multiple Hosts</div>

                    <div class="panel-options">
                        <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                        <a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
                    </div>
                </div>

                <div class="panel-body">

                    <form enctype="multipart/form-data" action="" method="POST">
                        <div class="form-group">
                            <label class="control-label">Upload Nessus or NMap XML</label>
                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                <div class="input-group">
                                    <div class="form-control uneditable-input" data-trigger="fileinput">
                                        <i class="glyphicon glyphicon-file fileinput-exists"></i>
                                        <span class="fileinput-filename"></span>
                                    </div>
                                                <span class="input-group-addon btn btn-default btn-file">
                                                    <span class="fileinput-new">Select file</span>
                                                    <span class="fileinput-exists">Change</span>
                                                    <input type="file" name="uploadedfile">
                                                </span>
                                    <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="MAX_FILE_SIZE" value="99999999999999999">

                        <div class="form-group">
                            <input type="hidden" name="projectname" value="<?php echo $project;?>" />
                            <button type="submit" name="addMultiple" class="btn btn-success">Add Hosts</button>
                            <button type="reset" class="btn">Reset</button>
                        </div>

                    </form>
                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="panel-title">Active Hosts</div>

                    <div class="panel-options">
                        <a href="#" data-rel="collapse"><i class="entypo-down-open" data-toggle="tooltip" data-placement="top" title="" data-original-title="Collapse"></i></a>
                        <a href="#" data-rel="reload"><i class="entypo-arrows-ccw" data-toggle="tooltip" data-placement="top" title="" data-original-title="Refresh"></i></a>
                    </div>
                </div>

                <table class="table table-bordered table-responsive">
                    <thead>
                    <tr>
                        <th width="10%">Host</th>
                        <th>Ports</th>
                    </tr>
                    </thead>

                    <tbody>
                    <?php

                    if(!empty($ports)) {
                        foreach($ports as $key => $value) {
                            echo '<tr>';
                            echo '<td><a href="hostinfo.php?project='.$project.'&host='.$key.'">'.$key.'</a></td>';
                            echo '<td>';
                            foreach($value as $port) {
                                foreach($port as $p) {
                                    echo $p.", ";
                                }

                            }
                            echo '</td>';
                            echo '</tr>';
                        }
                    } else {
                        echo '<tr><td></td></tr>';
                    }?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <form role="form" id="form2" method="post" class="validate" action="">
        <input type="hidden" name="filler" value="filler" />
        <button type="submit" name="delete" class="btn btn-danger">Delete Project</button>
    </form>
    <?php
    $page->endBody();
    echo $page->render('includes/template.php');

} else {
    Redirect::to('login.php');
}