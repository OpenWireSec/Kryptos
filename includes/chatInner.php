<?php
require_once 'core/Init.php';
$user = new User();

$activeUsers = DB::getInstance()->getAssoc("SELECT username,id FROM users WHERE isLoggedIn = ?", array(1));
foreach($activeUsers->results() as $results) {
    $active[] = $results;
}

?>

<div class="chat-inner">
    <h2 class="chat-header">
        <a href="#" class="chat-close"><i class="entypo-cancel"></i></a>
        <i class="entypo-users"></i>Chat
    </h2>
    <div class="chat-group" id="group-1">
        <strong>Members Online</strong>
        <?php
        foreach($active as $users) {
            $id = $users['id'];
            $username = $users['username'];
            ?>
            <a href="#" id="<?php echo $id; ?>"><span class="user-status is-online"></span> <em><?php echo $username; ?></em></a>
        <?php }
        ?>
    </div>
</div>