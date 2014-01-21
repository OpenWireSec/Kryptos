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

    if (isset($_GET["port"])) {
        $port = $_GET['port'];
    }
    if (!isset($port)) {
        Redirect::to('index.php');
    }

    $getPorts = DB::getInstance()->getAssoc("SELECT * FROM hosts WHERE host = ? AND port = ?", array($host, $port));
    foreach($getPorts->results() as $results) {
        $ports[] = $results;
    }

    if(!empty($ports)) {
        foreach($ports as $key => $value) {
            $projectname = $value['project'];
        }
    }

    $getNotes = DB::getInstance()->getAssoc("SELECT * FROM portnotes WHERE host = ? AND project = ? AND port = ?", array($host, $projectname, $port));
    foreach($getNotes->results() as $results) {
        $notes[] = $results;
    }

    if(!empty($notes)) {
        $notesID = $notes[0]['id'];
    }

    if(Input::exists()) {
        if(isset($_POST['editNotes'])) {
            if(!empty($notes)) {
                $editHost = DB::getInstance()->update('portnotes', $notesID, array(
                    'host' => $host,
                    'project' => $projectname,
                    'port' => $port,
                    'notes' => Input::get('notes')
                ));
            } else {
                $addHost = DB::getInstance()->insertAssoc('portnotes', array(
                    'host' => $host,
                    'project' => $projectname,
                    'port' => $port,
                    'notes' => Input::get('notes')
                ));
            }
            Redirect::to('portinfo.php?project='.htmlentities($project).'&host='.htmlentities($host).'&port='.htmlentities($port));
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
            <li><a href="project.php?name=<?php echo $projectname;?>"><?php echo $projectname;?></a></li>
            <li><a href="hostinfo.php?project=<?php echo $project; ?>&host=<?php echo $host;?>"><?php echo $host;?></a></li>
            <li class="active"><?php echo htmlentities($port); ?></li>
        </ol>

    </div>

    <div class="panel panel-primary">
        <div class="panel-heading">
            <div class="panel-title">Port Information</div>

            <div class="panel-options">
                <a href="#" data-rel="collapse"><i class="entypo-down-open" data-toggle="tooltip" data-placement="top" title="" data-original-title="Collapse"></i></a>
                <a href="#" data-rel="reload"><i class="entypo-arrows-ccw" data-toggle="tooltip" data-placement="top" title="" data-original-title="Refresh"></i></a>
            </div>
        </div>

        <table class="table table-bordered table-responsive">
            <thead>
            <tr>
                <th width="1%">Port</th>
                <th>Port Info</th>
            </tr>
            </thead>

            <tbody>
            <?php
            if(!empty($ports)) {
                foreach($ports as $key => $value) {
                    if($value['port'] != NULL) {
                        echo '<tr>';
                        echo '<td><span class="badge badge-info badge-roundless">'.$value['port'].'</span></td>';
                        echo '<td>';
                        if($value['protocol'] != NULL)
                            echo 'Protocol: <span style="color: #ac1818">'.ucwords($value['protocol']).'</span><br>';
                        if($value['state'] != NULL)
                            echo 'State: <span style="color: #ac1818">'.ucwords($value['state']).'</span><br>';
                        if($value['name'] != NULL)
                            echo 'Name: <span style="color: #ac1818">'.ucwords($value['name']).'</span><br>';
                        if($value['product'] != NULL)
                            echo 'Product: <span style="color: #ac1818">'.ucwords($value['product']).'</span><br>';
                        if($value['version'] != NULL)
                            echo 'Version: <span style="color: #ac1818">'.ucwords($value['version']).'</span><br>';
                        echo '</td>';
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

    <div class="col-md-12">

        <div class="panel panel-invert" data-collapsed="0"><!-- setting the attribute data-collapsed="1" will collapse the panel -->

            <!-- panel head -->
            <div class="panel-heading">
                <div class="panel-title">Port Notes</div>

                <div class="panel-options">
                    <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                    <a href="#" data-rel="close"><i class="entypo-cancel"></i></a>
                </div>
            </div>

            <!-- panel body -->
            <div class="panel-body">
                <form role="form" id="form2" method="post" class="validate" action="">
                    <textarea name="notes" id="notes" placeholder="Port Notes" style="background-color: transparent; border: none; width: 100%; height: 100%; min-height: 200px;color: #fff; resize: none;"><?php if(!empty($notes)) { foreach($notes as $note) { echo $note['notes']; } } ?></textarea>
            </div>
        </div>
        <button type="submit" name="editNotes" class="btn btn-success">Edit Notes</button>
        </form><br><br>
    </div>

    <?php
    $page->endBody();
    echo $page->render('includes/template.php');

} else {
    Redirect::to('login.php');
}