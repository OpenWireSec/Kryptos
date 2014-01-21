<?php
require_once 'core/Init.php';
$user = new User();

if($user->isLoggedIn()) {

    $activeUsers = DB::getInstance()->getAssoc("SELECT username,location FROM users");
    foreach($activeUsers->results() as $results) {
        $active[] = $results;
    }

    $page = new Page;
    $page->setTitle('Who\'s Online');
    $page->startBody();
    ?>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <div class="panel-title">Members</div>

            <div class="panel-options">
                <a href="#" data-rel="collapse"><i class="entypo-down-open" data-toggle="tooltip" data-placement="top" title="" data-original-title="Collapse"></i></a>
                <a href="#" data-rel="reload"><i class="entypo-arrows-ccw" data-toggle="tooltip" data-placement="top" title="" data-original-title="Refresh"></i></a>
            </div>
        </div>

        <table class="table table-bordered table-responsive">
            <thead>
            <tr>
                <th width="10%">Username</th>
                <th>Last Location</th>
            </tr>
            </thead>

            <tbody>
            <?php
            foreach($active as $users) {
                echo "<tr>";
                echo "<td>".$users['username']."</td>";
                echo "<td>".$users['location']."</td>";
                echo "</tr>";
            }
            ?>
            </tbody>
        </table>
    </div>
    <?php
    $page->endBody();
    echo $page->render('includes/template.php');

} else {
    Redirect::to('login.php');
}
