<?php
require_once 'core/Init.php';
$user = new User();

if($user->isLoggedIn()) {
    $all = DB::getInstance()->getAssoc("SELECT DISTINCT project FROM hosts");
    foreach($all->results() as $results) {
        $allProjects[] = $results;
    }
}
?>
<div class="page-container horizontal-menu">
    <header class="navbar navbar-fixed-top">

        <div class="navbar-inner">

            <!-- logo -->
            <div class="navbar-brand">
                <a href="index.php">
                    <img src="assets/images/logo-horizontal.png" alt="" />
                </a>
            </div>

            <!-- notifications and other links -->

            <ul class="navbar-nav">
                <li>
                    <a href="index.php"><i class="entypo-layout"></i><span>Home</span></a>
                </li>
                <li>
                    <a href="#"><i class="entypo-flow-tree"></i><span>Projects</span></a>
                    <ul>
                        <?php
                        if (!empty($allProjects)) {
                            foreach ($allProjects as $projects) {
                                echo '<li>';
                                echo '<a href="project.php?name='.$projects['project'].'"><i class="entypo-flow-line"></i><span>'.$projects['project'].'</span></a>';
                                echo '</li>';
                            }
                        } else {
                            echo '<li>';
                            echo '<a name="none"><i class="entypo-flow-line"></i><span>No Projects</span></a>';
                            echo '</li>';
                        }
                        ?>
                    </ul>
                </li>
                <li>
                    <a href="online.php"><i class="entypo-users"></i><span>Who's Online</span></a>
                </li>
                <li>
                    <a href="members.php"><i class="entypo-network"></i><span>Member List</span></a>
                </li>
                <li>
                    <a href="newproject.php"><i class="entypo-plus"></i><span>New Project</span></a>
                </li>
                <li>
                    <a href="adduser.php"><i class="entypo-user-add"></i><span>Add User</span></a>
                </li>

            </ul>
            <ul class="nav navbar-right pull-right">
                <li>
                    <a href="#" data-toggle="chat" data-animate="1" data-collapse-sidebar="1">
                        <i class="entypo-chat"></i>
                        Chat

                        <span class="badge badge-success chat-notifications-badge is-hidden">0</span>
                    </a>
                </li>
                <li>
                    <a href="edituser.php?id=<?php echo htmlentities($user->data()->id); ?>"><?php echo $user->data()->username; ?></a>
                </li>
                <li>
                    <a href="logout.php">
                        Log Out <i class="entypo-logout right"></i>
                    </a>
                </li>


                <!-- mobile only -->
                <li class="visible-xs">
                    <!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
                    <div class="horizontal-mobile-menu visible-xs">
                        <a href="#" class="with-animation"><!-- add class "with-animation" to support animation -->
                            <i class="entypo-menu"></i>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </header>
    <div class="main-content">
        <div class="paddingtable">


            <link rel="stylesheet" href="assets/js/jvectormap/jquery-jvectormap-1.2.2.css">
            <link rel="stylesheet" href="assets/js/rickshaw/rickshaw.min.css">
            <link rel="stylesheet" href="assets/js/select2/select2-bootstrap.css">
            <link rel="stylesheet" href="assets/js/select2/select2.css">
            <script src="assets/js/gsap/main-gsap.js"></script>
            <script src="assets/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>
            <script src="assets/js/joinable.js"></script>
            <script src="assets/js/resizeable.js"></script>
            <script src="assets/js/neon-api.js"></script>
            <script src="assets/js/jquery.dataTables.min.js"></script>
            <script src="assets/js/dataTables.bootstrap.js"></script>
            <script src="assets/js/select2/select2.min.js"></script>
            <script src="assets/js/neon-chat.js" id="script-resource-10"></script>
            <script src="assets/js/neon-custom.js" id="script-resource-11"></script>
            <script src="assets/js/neon-demo.js" id="script-resource-12"></script>
            <script src="assets/js/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
            <script src="assets/js/jvectormap/jquery-jvectormap-europe-merc-en.js"></script>
            <script src="assets/js/tocify/jquery.tocify.min.js"></script>
            <script src="assets/js/jquery.sparkline.min.js"></script>
            <script src="assets/js/rickshaw/vendor/d3.v3.js"></script>
            <script src="assets/js/rickshaw/rickshaw.min.js"></script>
            <script src="assets/js/raphael-min.js"></script>
            <script src="assets/js/morris.min.js"></script>
            <script src="assets/js/jquery.dataTables.min.js"></script>
            <script src="assets/js/dataTables.bootstrap.js"></script>
            <script src="assets/js/toastr.js"></script>
            <script src="assets/js/neon-chat.js"></script>
            <script src="assets/js/neon-custom.js"></script>
            <script src="assets/js/fileinput.js"></script>