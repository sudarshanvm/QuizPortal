<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="icon" href="favicon.ico" type="image/icon" sizes="16x16">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> Admin</title>

<link  rel="stylesheet" href="css/bootstrap.min.css"/>
 <link  rel="stylesheet" href="css/bootstrap-theme.min.css"/>    
 <link rel="stylesheet" href="css/main.css">
 <link  rel="stylesheet" href="css/font.css">
 <script src="js/jquery.js" type="text/javascript"></script>

  <script src="js/bootstrap.min.js"  type="text/javascript"></script>
  <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
</head>


<body  style="background:#000;">
<div class="header">
<div class="row">
<div class="col-lg-6">
<span class="logo">Quiz Portal</span>
</div>


<?php
include_once 'databaseCon.php';
session_start();
if (!(isset($_SESSION['username']))  || ($_SESSION['key']) != '54585c506829293a2d4c3b68543b316e2e7a2d277858545a36362e5f39') {
    session_destroy();
    header("location:index.php");
} else {
    $name     = $_SESSION['name'];
    $username = $_SESSION['username'];
    
    include_once 'databaseCon.php';
    echo '<span class="pull-right top title1" ><span style="color:white"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;Hello,</span> <span class="log log1" style="color:lightyellow">' . $name . '&nbsp;&nbsp;|&nbsp;&nbsp;<a href="logout.php?q=account.php" style="color:lightyellow"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;Logout</button></a></span>';
}
?>
</div>
</div>

<!-- 
Navigation bar -->

<nav class="navbar navbar-default title1">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="dash.php?q=0"><b>Dashboard</b></a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li <?php
if (@$_GET['q'] == 0)
    echo 'class="active"';
?>><a href="dash.php?q=0">Home<span class="sr-only">(current)</span></a></li>
        <li <?php
if (@$_GET['q'] == 1)
    echo 'class="active"';
?>><a href="dash.php?q=1">Users</a></li>
    <li <?php
if (@$_GET['q'] == 2)
    echo 'class="active"';
?>><a href="dash.php?q=2">Leaderboard</a></li>
        <li <?php
if (@$_GET['q'] == 3)
    echo 'class="active"';
?>><a href="dash.php?q=3">Add Quiz</a></li>
        <li <?php
if (@$_GET['q'] == 4)
    echo 'class="active"';
?>><a href="dash.php?q=4">Remove Quiz</a></li>
      </ul>
          </div>
  </div>
</nav>


<div class="container">
<div class="row">
<div class="col-md-12">

<?php 


//HOME
if(@_GET['q']==0)
{
	$result= mysqli_query($con,"SELECT * FROM Exam ORDER BY examid ASC") or die("Error");
	  echo '<div class="panel">
	  <table class="table table-striped title1"  style="vertical-align:middle">
	<tr>
	<td style="vertical-align:middle"><b>Exam ID</b></td>
	<td style="vertical-align:middle"><b>Course Name</b></td>
	<td style="vertical-align:middle"><b>Course Code</b></td>
	<td style="vertical-align:middle"><b>Sem</b></td>
	 <td style="vertical-align:middle"><b>Marks</b></td>
	<td style="vertical-align:middle"><b>Time limit</b></td>
	<td style="vertical-align:middle"><b>Status</b></td>
	<td style="vertical-align:middle"><b>Action</b></td>
	</tr>';

	// $c = 1;
    while ($row = mysqli_fetch_array($result)) {
    	$eid     = $row['examid'];
        $title   = $row['coursename'];
        // $total   = $row['total'];
        $code    = $row['coursecode'];
        $sem 	 = $row['Sem'];
        // $correct = $row['correct'];
        // $time    = $row['time'];
        $time     = 20;
        
        $marks    = 10;
        
// status column to be added somewhere in table
        $status  = $row['#status'];
        if ($status == "enabled") {
            echo '<tr>
            <td style="vertical-align:middle">' . $eid . '</td>
            <td style="vertical-align:middle">' . $title . '</td>
            <td style="vertical-align:middle">' . $code . '</td>
             <td style="vertical-align:middle">' . $sem . '</td>
            <td style="vertical-align:middle">' . $marks . '</td>
            <td style="vertical-align:middle">' . $time . '&nbsp;min</td>
            <td style="vertical-align:middle">Enabled</td>
  			<td style="vertical-align:middle"><b><a href="update.php?deidquiz=' . $eid . '" class="btn logb" style="color:#FFFFFF;background:#ff0000;font-size:12px;padding:5px;">&nbsp;<span><b>Disable</b></span></a></b></td>
  			</tr>';

        } else {
            echo '<tr>
            <td style="vertical-align:middle">' . $eid . '</td>
            <td style="vertical-align:middle">' . $title . '</td>
            <td style="vertical-align:middle">' . $code . '</td>
             <td style="vertical-align:middle">' . $sem . '</td>
            <td style="vertical-align:middle">' . $marks . '</td>
            <td style="vertical-align:middle">' . $time . '&nbsp;min</td>
            <td style="vertical-align:middle">Disabled</td>
  			<td style="vertical-align:middle"><b><a href="update.php?deidquiz=' . $eid . '" class="btn logb" style="color:#FFFFFF;background:#ff0000;font-size:12px;padding:5px;">&nbsp;<span><b>Enable</b></span></a></b></td>
  			</tr>';
        

            // update.php to be created
        

        }
    }

}


// REMOVE QUIZ

if (@_GET['q'] == 4) {
    
    $result = mysqli_query($con, "SELECT * FROM Exam ORDER BY examid ASC") or die('Error');
    echo '<div class="panel">
    <table class="table table-striped title1">
	<tr>
	<td style="vertical-align:middle"><b>Exam ID</b></td>
	<td style="vertical-align:middle"><b>Course Name</b></td>
	<td style="vertical-align:middle"><b>Course Code</b></td>
	<td style="vertical-align:middle"><b>Sem</b></td>
	 <td style="vertical-align:middle"><b>Marks</b></td>
	<td style="vertical-align:middle"><b>Time limit</b></td>
	<td style="vertical-align:middle"><b>Action</b></td>
	</tr>';
    // $c = 1;
    while ($row = mysqli_fetch_array($result)) {
        $eid     = $row['examid'];
        $title   = $row['coursename'];
        // $total   = $row['total'];
        $code    = $row['coursecode'];
        $sem 	 = $row['Sem'];
        // $correct = $row['correct'];
        // $time    = $row['time'];
        $time     = 20;
        
        $marks    = 10;
        
// status column to be added somewhere in table
        $status  = $row['#status'];

        echo '<tr>
        <td style="vertical-align:middle">' . $eid . '</td>
            <td style="vertical-align:middle">' . $title . '</td>
            <td style="vertical-align:middle">' . $code . '</td>
             <td style="vertical-align:middle">' . $sem . '</td>
            <td style="vertical-align:middle">' . $marks . '</td>
            <td style="vertical-align:middle">' . $time . '&nbsp;min</td>
  <td style="vertical-align:middle"><b><a href="update.php?q=rmquiz&eid=' . $eid . '" class="btn" style="margin:0px;background:red;color:white">&nbsp;<span class="title1"><b>Remove</b></span></a></b></td></tr>';
    }
    // $c = 0;
    echo '</table></div>';
    
}

 ?>



</div>
</div>
</div>





</body>
</html>