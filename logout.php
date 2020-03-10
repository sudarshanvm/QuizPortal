<?php
session_start();
if (isset($_SESSION['username'])) {
    session_destroy();
}
// redirect to the homapage
// $ref = @$_GET['q'];

 // Delete the username cookie by setting their expirations to an hour ago (3600)
setcookie('username', '', time() - 3600);

header("location:index.php");
?>