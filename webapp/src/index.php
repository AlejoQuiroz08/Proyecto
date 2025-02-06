<?php
function redirectTo($url) {
    header('Location: ' . $url);
    exit;
}
redirectTo('login.php');