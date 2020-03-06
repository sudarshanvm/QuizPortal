<?php
session_start();
if (isset($_SESSION["username"])) {
    session_destroy();
}
include_once 'databaseCon.php';
$ref      = @$_GET['q'];
$username = $_POST['username'];
$password = $_POST['password'];

$username = stripslashes($username);
$username = addslashes($username);
$password = stripslashes($password);
$password = addslashes($password);
$password = md5($password);
$result = mysqli_query($con, "SELECT usn FROM Student WHERE usn = '$username' and password = '$password'") or die('Error');
$count = mysqli_num_rows($result);
if ($count == 1) {
    while ($row = mysqli_fetch_array($result)) {
        $name = $row['usn'];
    }
    $_SESSION["name"]     = $name;
    $_SESSION["username"] = $username;
    header("location:account.php?q=1");
} else
    header("location:$ref?w=Wrong Username or Password");


?>