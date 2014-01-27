<?php
require_once 'core/Init.php';
$user = new User();


if($user->isLoggedIn()) {

    $projectname = '';
    if (isset($_GET["challenge"])) {
        $challenge = $_GET['challenge'];
    }
    if (!isset($challenge)) {
        Redirect::to('index.php');
    }
    if (isset($_GET["project"])) {
        $project = $_GET['project'];
    }
    if (!isset($project)) {
        Redirect::to('index.php');
    }

    $getID = DB::getInstance()->getAssoc("SELECT * FROM challenges WHERE challengeName = ? AND project = ?", array($challenge, $project));
    foreach($getID->results() as $results) {
        $challengeID[] = $results;
    }

    if(!empty($challengeID)) {
        $id = $challengeID[0]['id'];
    }

    $getsourceID = DB::getInstance()->getAssoc("SELECT * FROM source WHERE challenge = ? AND project = ?", array($challenge, $project));
    foreach($getsourceID->results() as $results) {
        $sourceID[] = $results;
    }

    if(!empty($sourceID)) {
        $source_id = $sourceID[0]['id'];
    }
    $getNotes = DB::getInstance()->getAssoc("SELECT * FROM challengenotes WHERE challenge = ? AND project = ?", array($challenge, $project));
    foreach($getNotes->results() as $results) {
        $notes[] = $results;
    }
    $getnotesID = DB::getInstance()->getAssoc("SELECT * FROM challengenotes WHERE challenge = ? AND project = ?", array($challenge, $project));
    foreach($getnotesID->results() as $results) {
        $notesID[] = $results;
    }

    if(!empty($notesID)) {
        $challengeNotes_id = $notesID[0]['id'];
    }

    $getScreenshots = DB::getInstance()->getAssoc("SELECT * FROM screenshots WHERE challenge = ? AND project = ?", array($challenge, $project));
    foreach($getScreenshots->results() as $results) {
        $screenshotsArray[] = $results;
    }

    if(Input::exists()) {
        if(isset($_POST['ss'])) {
            if(isset($_FILES['screenshots'])){
                $errors= array();
                foreach($_FILES['screenshots']['tmp_name'] as $key => $tmp_name ){
                    $file_name = $key.$_FILES['screenshots']['name'][$key];
                    $file_size =$_FILES['screenshots']['size'][$key];
                    $file_tmp =$_FILES['screenshots']['tmp_name'][$key];
                    $file_type=$_FILES['screenshots']['type'][$key];
                    if($file_size > 2097152){
                        $errors[]='File size must be less than 2 MB';
                    }

                    $screenshots = DB::getInstance()->insertAssoc('screenshots', array(
                        'url' => htmlentities($file_name),
                        'project' => htmlentities($project),
                        'challenge' => htmlentities($challenge)
                    ));

                    $desired_dir = "uploads";
                    if(empty($errors)==true){
                        if(is_dir($desired_dir) == false){
                            mkdir("$desired_dir", 0700);
                        }
                        if(is_dir("$desired_dir/".$file_name) == false){
                            move_uploaded_file($file_tmp,"uploads/".$file_name);
                        }else{
                            $new_dir="uploads/".$file_name.time();
                            rename($file_tmp,$new_dir) ;
                        }
                        mysql_query($query);
                    }else{
                        print_r($errors);
                    }
                }
                if(empty($error)){
                    echo "Success";
                }
                Redirect::to('challengeinfo.php?project='.htmlentities($project).'&challenge='.htmlentities($challenge));
            } else {
                echo "Failed";
            }
        }
        if(isset($_POST['editNotes'])) {
            if(!empty($notes)) {
                $editHost = DB::getInstance()->update('challengenotes', $challengeNotes_id, array(
                    'challenge' => $challenge,
                    'project' => $project,
                    'notes' => Input::get('notes')
                ));
            } else {
                $addHost = DB::getInstance()->insertAssoc('challengenotes', array(
                    'challenge' => $challenge,
                    'project' => $project,
                    'notes' => Input::get('notes')
                ));
            }
            Redirect::to('challengeinfo.php?project='.htmlentities($project).'&challenge='.htmlentities($challenge));
        }
        if(isset($_POST['addSource'])) {
            if($_FILES['uploadsource']['size'] != 0) {
                if($_FILES['uploadsource']['type'] == 'text/plain') {
                    $target_path = "queue/";
                    $target_path = $target_path . basename( $_FILES['uploadsource']['name']);
                    $source = htmlentities(file_get_contents($_FILES['uploadsource']['tmp_name']));

                    if(move_uploaded_file($_FILES['uploadsource']['tmp_name'], $target_path)) {
                        $addSource = DB::getInstance()->insertAssoc('source', array(
                            'source' => $source,
                            'project' => $project,
                            'challenge' => $challenge
                        ));
                        Redirect::to('challengeinfo.php?project='.htmlentities($project).'&challenge='.htmlentities($challenge));
                    } else{
                        echo "There was an error uploading the file, please try again!";
                        Redirect::to('challengeinfo.php?project='.htmlentities($project).'&challenge='.htmlentities($challenge));
                    }
                } else {
                    echo "Invalid File Type";
                    Redirect::to('challengeinfo.php?project='.htmlentities($project).'&challenge='.htmlentities($challenge));
                }
            }
        }
    }

    $page = new Page;
    $page->setTitle('Challenge Information');
    $page->startBody();
    ?>
    <link href="assets/css/lightbox.css" rel="stylesheet" />
    <script src="assets/js/lightbox-2.6.min.js"></script>

    <div class="panel-body">

        <ol class="breadcrumb">
            <li>
                <a href="index.php">
                    <i class="entypo-folder"></i>
                    Dashboard
                </a>
            </li>
            <li><a href="project.php?name=<?php echo htmlentities($project);?>"><?php echo htmlentities($project);?></a></li>
            <li class="active"><?php echo htmlentities($challenge); ?></li>
        </ol>

    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-invert" data-collapsed="0"><!-- setting the attribute data-collapsed="1" will collapse the panel -->

                <!-- panel head -->
                <div class="panel-heading">
                    <div class="panel-title">Challenge Notes</div>

                    <div class="panel-options">
                        <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                        <a href="#" data-rel="close"><i class="entypo-cancel"></i></a>
                    </div>
                </div>

                <!-- panel body -->
                <div class="panel-body">
                    <form role="form" id="form2" method="post" class="validate" action="">
                        <textarea name="notes" id="notes" placeholder="Challenge Notes" style="background-color: transparent; border: none; width: 100%; height: 100%; min-height: 200px;color: #fff; resize: none;"><?php if(!empty($notes)) { foreach($notes as $note) { echo $note['notes']; } } ?></textarea>
                </div>
            </div>
            <button type="submit" name="editNotes" class="btn btn-success">Edit Notes</button>
            </form><br><br>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="panel-title">Screenshots</div>

                    <div class="panel-options">
                        <a href="#" data-rel="collapse"><i class="entypo-down-open" data-toggle="tooltip" data-placement="top" title="" data-original-title="Collapse"></i></a>
                        <a href="#" data-rel="reload"><i class="entypo-arrows-ccw" data-toggle="tooltip" data-placement="top" title="" data-original-title="Refresh"></i></a>
                    </div>
                </div>

                <div class="table table-bordered table-responsive scrollable" data-height="200px">
                    <?php
                    if(!empty($screenshotsArray)) {
                        $counter = 0;
                        foreach($screenshotsArray as $ss) {
                            $url = $ss['url'];
                            echo '<a href="uploads/'.$url.'" data-lightbox="'.$url.'"> <img src="uploads/'.$url.'" height="100px" width="100px"></a>';
                            $counter = $counter + 1;
                            if($counter == 4) {
                                echo "<br>";
                                $counter = 0;
                            }
                        }
                    } else {
                        echo '<br><p align="center">No Screenshots Available</p>';
                    }?>

                </div>
            </div>
            <div class="panel panel-primary" data-collapsed="0">
                <div class="panel-heading">
                    <div class="panel-title">
                        Screenshot Upload
                    </div>
                </div>
                <div class="panel-body">

                    <form enctype="multipart/form-data" action="" method="POST">
                        <div class="form-group">
                            <label class="control-label">Upload Screenshot</label>
                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                <div class="input-group">
                                    <div class="form-control uneditable-input" data-trigger="fileinput">
                                        <i class="glyphicon glyphicon-file fileinput-exists"></i>
                                        <span class="fileinput-filename"></span>
                                    </div>
                                                <span class="input-group-addon btn btn-default btn-file">
                                                    <span class="fileinput-new">Select file</span>
                                                    <span class="fileinput-exists">Change</span>
                                                    <input type="file" multiple="1" name="screenshots[]">
                                                </span>
                                    <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="MAX_FILE_SIZE" value="99999999999999999">

                        <div class="form-group">
                            <input type="hidden" name="projectname" value="<?php echo $project;?>" />
                            <button type="submit" name="ss" class="btn btn-success">Add Screenshot</button>
                            <button type="reset" class="btn">Reset</button>
                        </div>
                    </form>

                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="panel-title">Add Source Code</div>

                    <div class="panel-options">
                        <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                        <a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
                    </div>
                </div>

                <div class="panel-body">
                    <form enctype="multipart/form-data" action="" method="POST">
                        <div class="form-group">
                            <label class="control-label">Upload Source Code (TXT File)</label>
                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                <div class="input-group">
                                    <div class="form-control uneditable-input" data-trigger="fileinput">
                                        <i class="glyphicon glyphicon-file fileinput-exists"></i>
                                        <span class="fileinput-filename"></span>
                                    </div>
                                                <span class="input-group-addon btn btn-default btn-file">
                                                    <span class="fileinput-new">Select file</span>
                                                    <span class="fileinput-exists">Change</span>
                                                    <input type="file" name="uploadsource">
                                                </span>
                                    <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="MAX_FILE_SIZE" value="99999999999999999">

                        <div class="form-group">
                            <input type="hidden" name="projectname" value="<?php echo $project;?>" />
                            <button type="submit" name="addSource" class="btn btn-success">Add Source</button>
                            <button type="reset" class="btn">Reset</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="panel-title">Source Code</div>
                    <div class="panel-options">
                        <a href="#" data-rel="collapse"><i class="entypo-down-open" data-toggle="tooltip" data-placement="top" title="" data-original-title="Collapse"></i></a>
                        <a href="#" data-rel="reload"><i class="entypo-arrows-ccw" data-toggle="tooltip" data-placement="top" title="" data-original-title="Refresh"></i></a>
                    </div>
                </div>

                <?php
                if(!empty($sourceID)) {
                    foreach ($sourceID as $source) {
                        ?>
                        <div class="col-md-2">
                            <?php
                            if(isset($_POST[$source['id']])) {
                                DB::getInstance()->delete('source', array('id', '=', $source['id']));
                                Redirect::to('challengeinfo.php?project='.htmlentities($project).'&challenge='.htmlentities($challenge));
                            }
                            ?>
                            <form role="form" id="form2" method="post" class="validate" action="">
                                <input type="hidden" name="filler" value="filler" />
                                <button type="submit" name="<?php echo $source['id']; ?>" class="btn btn-danger">Delete Source</button>
                            </form>
                        </div>
                        <div class="col-md-10">
                            <div class="scrollable" data-height="300" data-scroll-position="right" data-rail-color="#fff" data-rail-opacity=".9" data-rail-width="8" data-rail-radius="10" data-autohide="0">
                                <pre><code class="language-php"><?php echo $source['source']; ?></code></pre>
                            </div>
                        </div>
                    <?php }

                } else {
                    echo '<pre align="center">No Source Available</pre>';
                }
                ?>
            </div>
        </div>
    </div>
    <?php
    $page->endBody();
    echo $page->render('includes/template.php');

} else {
    Redirect::to('login.php');
}