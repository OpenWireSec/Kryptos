<?php
require_once 'core/Init.php';

function username() {
    $user = new User();
    $username = $user->data()->username;
    return $username;
}