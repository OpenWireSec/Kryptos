<?php
require_once 'core/Init.php';
$user = new User();


if($user->isLoggedIn()) {

    $projectname = '';

    if (isset($_GET["host"])) {
        $host = $_GET['host'];
    }
    if (!isset($host)) {
        Redirect::to('index.php');
    }
    if (isset($_GET["project"])) {
        $project = $_GET['project'];
    }
    if (!isset($project)) {
        Redirect::to('index.php');
    }

    $getPorts = DB::getInstance()->getAssoc("SELECT DISTINCT port,project,scannedFrom FROM hosts WHERE host = ? ORDER BY port", array($host));
    foreach($getPorts->results() as $results) {
        $ports[] = $results;
    }

    if(!empty($ports)) {
        foreach($ports as $key => $value) {
            $projectname = $value['project'];
        }
    }

    $getNotes = DB::getInstance()->getAssoc("SELECT * FROM hostnotes WHERE host = ? AND project = ?", array($host, $projectname));
    foreach($getNotes->results() as $results) {
        $notes[] = $results;
    }
    if(!empty($notes)) {
        $notesID = $notes[0]['id'];
    }

    $getScreenshots = DB::getInstance()->getAssoc("SELECT url FROM screenshots WHERE host = ? AND project = ?", array($host, $projectname));
    foreach($getScreenshots->results() as $results) {
        $screenshotsArray[] = $results;
    }

    if(Input::exists()) {
        if(isset($_POST['add'])) {
            $port = DB::getInstance()->insertAssoc('hosts', array(
                'host' => $host,
                'port' => Input::get('port'),
                'protocol' => Input::get('protocol'),
                'state' => Input::get('state'),
                'name' => Input::get('name'),
                'product' => Input::get('product'),
                'version' => Input::get('version'),
                'project' => Input::get('projectname'),
                'startedby' => $user->data()->username
            ));
            Redirect::to('hostinfo.php?project='.htmlentities($project).'&host='.htmlentities($host));
        }
        if(isset($_POST['editNotes'])) {
            if(!empty($notes)) {
                $editHost = DB::getInstance()->update('hostnotes', $notesID, array(
                    'host' => $host,
                    'project' => $projectname,
                    'notes' => Input::get('notes')
                ));
            } else {
                $addHost = DB::getInstance()->insertAssoc('hostnotes', array(
                    'host' => $host,
                    'project' => $projectname,
                    'notes' => Input::get('notes')
                ));
            }
            Redirect::to('hostinfo.php?project='.htmlentities($project).'&host='.htmlentities($host));
        }
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
                        'project' => htmlentities($projectname),
                        'host' => htmlentities($host)
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
                Redirect::to('hostinfo.php?project='.htmlentities($project).'&host='.htmlentities($host));
            } else {
                echo "Failed";
            }
        }
    }


    $page = new Page;
    $page->setTitle('Host Information');
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
            <li><a href="project.php?name=<?php echo htmlentities($projectname);?>"><?php echo htmlentities($projectname);?></a></li>
            <li class="active"><?php echo htmlentities($host); ?></li>
        </ol>

    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-invert" data-collapsed="0"><!-- setting the attribute data-collapsed="1" will collapse the panel -->

                <!-- panel head -->
                <div class="panel-heading">
                    <div class="panel-title">Host Notes</div>

                    <div class="panel-options">
                        <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                        <a href="#" data-rel="close"><i class="entypo-cancel"></i></a>
                    </div>
                </div>

                <!-- panel body -->
                <div class="panel-body">
                    <form role="form" id="form2" method="post" class="validate" action="">
                        <textarea name="notes" id="notes" placeholder="Host Notes" style="background-color: transparent; border: none; width: 100%; height: 100%; min-height: 200px;color: #fff; resize: none;"><?php if(!empty($notes)) { foreach($notes as $note) { echo $note['notes']; } } ?></textarea>
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
                            echo '<p align="center"><a href="uploads/'.$url.'" data-lightbox="'.$url.'"> <img src="uploads/'.$url.'" height="100px" width="100px"></a></p>';
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
                        <div class="panel-body">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Upload Screenshots</label>
                                <div class="col-sm-5">
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                        <div class="input-group">
									<span class="input-group-addon btn btn-default btn-file">
										<span class="fileinput-new">Select file</span>
										<span class="fileinput-exists">Change</span>
										<input type="file" multiple="1" name="screenshots[]">
									</span>
                                            <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="MAX_FILE_SIZE" value="99999999999999999">
                        </div>
                        <div class="form-group">
                            <br><br><br>
                            <button type="submit" name="ss" class="btn btn-success">Add Screenshots</button>
                            <button type="reset" class="btn">Reset</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="panel-title">Ports for Host: <?php echo htmlentities($host); ?></div>

                    <div class="panel-options">
                        <a href="#" data-rel="collapse"><i class="entypo-down-open" data-toggle="tooltip" data-placement="top" title="" data-original-title="Collapse"></i></a>
                        <a href="#" data-rel="reload"><i class="entypo-arrows-ccw" data-toggle="tooltip" data-placement="top" title="" data-original-title="Refresh"></i></a>
                    </div>
                </div>

                <table class="table table-bordered table-responsive">
                    <thead>
                    <tr>
                        <th width="1%">Port</th>
                            <th>Scanned From</th>
                    </tr>
                    </thead>

                    <tbody>
                    <?php
                    if(!empty($ports)) {
                        foreach($ports as $key => $value) {
                            if($value['port'] != NULL) {
                                echo '<tr>';
                                echo '<td><a href="portinfo.php?project='.$project.'&host='.$host.'&port='.$value['port'].'"><span class="badge badge-info badge-roundless">'.$value['port'].'</span></a></td>';

                                echo '<td>'.ucwords($value['scannedFrom']).'</td>';
                                echo '</tr>';
                            } else {
                                echo '<tr><td></td></tr>';
                            }
                        }
                    } else {
                        echo '<tr><td></td></tr>';
                    }?>
                    </tbody>
                </table>
            </div>



            <div class="panel panel-primary">

                <div class="panel-heading">
                    <div class="panel-title">Add New Port</div>

                    <div class="panel-options">
                        <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                        <a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
                    </div>
                </div>

                <div class="panel-body">

                    <form role="form" id="form1" method="post" class="validate" action="">

                        <div class="form-group">
                            <label class="control-label">Port Number</label>
                            <input type="text" class="form-control" name="port" id="port" data-validate="required" data-message-required="Port Number is Required" placeholder="Port Number" />
                        </div>

                        <div class="form-group">
                            <label class="control-label">Protocol</label>
                            <input type="text" class="form-control" name="protocol" id="protocol" data-validate="required" data-message-required="Protocol is Required" placeholder="Protocol" />
                        </div>

                        <div class="form-group">
                            <label class="control-label">State</label>
                            <input type="text" class="form-control" name="state" id="state" data-validate="required" data-message-required="Port State is Required" placeholder="Port State" />
                        </div>

                        <div class="form-group">
                            <label class="control-label">Name</label>
                            <input type="text" class="form-control" name="name" id="name" data-validate="required" data-message-required="Port Name is Required" placeholder="Port Name" />
                        </div>

                        <div class="form-group">
                            <label class="control-label">Product</label>
                            <input type="text" class="form-control" name="product" id="product" data-validate="required" data-message-required="Product is Required" placeholder="Product Name" />
                        </div>

                        <div class="form-group">
                            <?php if(!empty($ports)) {
                                foreach($ports as $key => $value) { ?>
                                    <input type="hidden" name="projectname" value="<?php echo htmlentities($value['project']); ?>" />
                                <?php }} ?>
                            <button type="submit" name="add" class="btn btn-success">Add Port</button>
                            <button type="reset" class="btn">Reset</button>
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>
    <?php
    $page->endBody();
    echo $page->render('includes/template.php');

} else {
    Redirect::to('login.php');
}