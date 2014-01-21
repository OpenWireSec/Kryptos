<?php
require_once 'core/Init.php';
$user = new User();

if($user->isLoggedIn()) {
    $text = $_POST['text'];
    $fp = fopen("log.html", 'a');
    fwrite($fp, "<div class='msgln'>(".date("g:i A").") <b>".$user->data()->username."</b>: ".stripslashes(htmlspecialchars($text))."<br></div>");
    fclose($fp);
}