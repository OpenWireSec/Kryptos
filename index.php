<?php
require_once 'core/Init.php';

$user = new User();

if($user->isLoggedIn()) {
    $activeScans = DB::getInstance()->getAssoc("SELECT DISTINCT project, startedby FROM hosts ORDER BY project ASC");
    foreach($activeScans->results() as $results) {
        $active[] = $results;
    }


    $page = new Page;
    $page->setTitle('Dashboard');
    $page->startBody();
    if(!empty($active)) {

    ?>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <div class="panel-title">Active Projects</div>

            <div class="panel-options">
                <a href="#" data-rel="collapse"><i class="entypo-down-open" data-toggle="tooltip" data-placement="top" title="" data-original-title="Collapse"></i></a>
                <a href="#" data-rel="reload"><i class="entypo-arrows-ccw" data-toggle="tooltip" data-placement="top" title="" data-original-title="Refresh"></i></a>
            </div>
        </div>

        <table class="table table-bordered table-responsive">
            <thead>
            <tr>
                <th width="10%">Project Name</th>
                <th>Started By</th>
            </tr>
            </thead>

            <tbody>
            <?php
                foreach($active as $project) {
                    echo '<tr>';
                    echo '<td><a href="project.php?name='.$project['project'].'">'.$project['project'].'</a></td>';
                    echo '<td>';
                    echo $project['startedby'];
                    echo '</td>';
                    echo '</tr>';
                } ?>
            </tbody>
        </table>
    </div>
    <?php

    } else { ?>

        <pre>
            <h2>No Projects</h2>
        </pre>


    <?php }

    $page->endBody();
    echo $page->render('includes/template.php');
} else {
    Redirect::to('login.php');
}