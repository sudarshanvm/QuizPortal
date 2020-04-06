<?php
	
	// echo  "logged in succesfully" ;
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="icon" href="favicon.ico" type="image/icon" sizes="16x16">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Quiz Portal</title>
<link  rel="stylesheet" href="css/bootstrap.min.css"/>
<link  rel="stylesheet" href="css/bootstrap-theme.min.css"/>    
<link rel="stylesheet" href="css/main.css">
<link  rel="stylesheet" href="css/font.css">
<script src="js/jquery.js" type="text/javascript"></script>

 
<script src="js/bootstrap.min.js"  type="text/javascript"></script>
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
<?php
if (@$_GET['w']) {
    echo '<script>alert("' . @$_GET['w'] . '");</script>';
}
?>
</head>
<?php
include_once 'databaseCon.php';
?>
<body>


<div class="header">
<div class="row">
<div class="col-lg-6">
<span class="logo">Quiz Portal</span></div>
<div class="col-md-4 col-md-offset-2">
 <?php
include_once 'databaseCon.php';
session_start();
if (!(isset($_SESSION['username']))) {
    header("location:index.php");
} else {
    $name     = $_SESSION['name'];
    $username = $_SESSION['username'];
    
    include_once 'databaseCon.php';
    echo '<span class="pull-right top title1" ><span style="color:white"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;&nbsp;Hello,</span> <span class="log log1" style="color:lightyellow">' . $username . '&nbsp;&nbsp;|&nbsp;&nbsp;<a href="logout.php?q=account.php" style="color:lightyellow"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>&nbsp;Logout</button></a></span>';
}
?>
</div>
</div></div>


<div class="bg">
<nav class="navbar navbar-default title1">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
       <a class="navbar-brand" href="#"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></a>
    </div>
   <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
       
        <li <?php
			if (@$_GET['q'] == 1)
    			echo 'class="active"';
			?>>
			<a href="account.php?q=1"><span aria-hidden="true"></span>Home<span class="sr-only">(current)</span></a></li>
       
        <li <?php
			if (@$_GET['q'] == 2)
    			echo 'class="active"';
			?>>
			<a href="account.php?q=2"><span aria-hidden="true"></span>&nbsp;&nbsp;Results</a></li>
    	
    	<!-- <li <?php
			// if (@$_GET['q'] == 3)
   //  			echo 'class="active"';
			?>>
			<a href="account.php?q=3"><span aria-hidden="true"></span>&nbsp;Leaderboard</a></li></ul>
             -->
    </div>
  </div>
</nav>


<div class="container">
<div class="row">
<div class="col-md-12">
<?php
if (@$_GET['q'] == 1) 
	{
		$result = mysqli_query($con, "SELECT * FROM quiz WHERE status = 'enabled' ORDER BY date DESC") or die('Error');
		echo '<div class="panel">
			<table class="table table-striped title1"  style="vertical-align:middle">
			<tr>
			<td style="vertical-align:middle"><b>S.N.</b></td>
			<td style="vertical-align:middle"><b>Name</b></td>
			<td style="vertical-align:middle"><b>Total questions</b>
			</td><td style="vertical-align:middle"><b>Marks for Correct Answer</b></td>
			<td style="vertical-align:middle"><b>Marks for Wrong Answer</b></td>
			<td style="vertical-align:middle"><b>Total Marks</b></td>
			<td style="vertical-align:middle"><b>Time limit</b></td>
			<td style="vertical-align:middle"><b>Action</b></td></tr>';

		$c = 1;
    	while ($row = mysqli_fetch_array($result)) 
    	{
        $title   = $row['coursetitle'];
        $total   = $row['total'];
        $correct = $row['correct'];
        $wrong   = $row['wrong'];
        $time    = $row['time'];
        $eid     = $row['eid'];
        $q12 = mysqli_query($con, "SELECT score FROM history WHERE eid='$eid' AND username='$username'") or die('Error98');
        $rowcount = mysqli_num_rows($q12);

         if ($rowcount == 0)
         {
            echo '<tr>
            	<td style="vertical-align:middle">' . $c++ . '</td>
            	<td style="vertical-align:middle">' . $title . '</td>
            	<td style="vertical-align:middle">' . $total . '</td>
            	<td style="vertical-align:middle">+' . $correct . '</td>
            	<td style="vertical-align:middle">-' . $wrong . '</td>
            	<td style="vertical-align:middle">' . $correct * $total . '</td>
            	<td style="vertical-align:middle">' . $time . '&nbsp;min</td>
  				<td style="vertical-align:middle"><b><a href="account.php?q=quiz&step=2&eid=' . $eid . '&n=1&t=' . $total . '&start=start" class="btn" style="color:#FFFFFF;background:darkgreen;font-size:12px;padding:7px;padding-left:10px;padding-right:10px"><span class="glyphicon glyphicon-new-window" aria-hidden="true"></span>&nbsp;<span><b>Start</b></span></a></b></td>
  				</tr>';
        }

        else
        {
			$q = mysqli_query($con, "SELECT * FROM history WHERE username='$_SESSION[username]' AND eid='$eid' ") or die('Error197');
            while ($row = mysqli_fetch_array($q)) 
            {
                $timec  = $row['timestamp'];
                $status = $row['status'];
            }

            $q = mysqli_query($con, "SELECT * FROM quiz WHERE eid='$eid' ") or die('Error197');
            while ($row = mysqli_fetch_array($q)) 
            {
                $ttimec  = $row['time'];
                $qstatus = $row['status'];
            }

            $remaining = (($ttimec * 60) - ((time() - $timec)));
        	if($remaining > 0 && $qstatus == "enabled" && $status == "ongoing") 
        	{
                echo '<tr style="color:darkgreen">
                <td style="vertical-align:middle">' . $c++ . '</td>
                <td style="vertical-align:middle">' . $title . '&nbsp;<span title="This quiz is already solved by you" class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                <td style="vertical-align:middle">' . $total . '</td>
                <td style="vertical-align:middle">+' . $correct . '</td>
                <td style="vertical-align:middle">-' . $wrong . '</td>
                <td style="vertical-align:middle">' . $correct * $total . '</td>
                <td style="vertical-align:middle">' . $time . '&nbsp;min</td>
  				<td style="vertical-align:middle"><b><a href="account.php?q=quiz&step=2&eid=' . $eid . '&n=1&t=' . $total . '&start=start" class="btn" style="margin:0px; background:darkorange; color:white"> &nbsp; <span class="title1"><b>Continue</b></span></a></b></td>
  				</tr>';
            }

            else 
            {
                echo '<tr style="color:darkgreen">
                <td style="vertical-align:middle">' . $c++ . '</td>
                <td style="vertical-align:middle">' . $title . '&nbsp;<span title="This quiz is already solve by you" class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>
                <td style="vertical-align:middle">' . $total . '</td>
                <td style="vertical-align:middle">+' . $correct . '</td>
                <td style="vertical-align:middle">-' . $wrong . '</td>
                <td style="vertical-align:middle">' . $correct * $total . '</td>
                <td style="vertical-align:middle">' . $time . '&nbsp;min</td>
  				<td style="vertical-align:middle"> <b><a href="account.php?q=result&eid=' . $eid . '" class="btn" style="margin:0px; background:darkred;color:white">&nbsp;<span class="title1"><b>View Result </b> </span></a></b></td>
  				</tr>';
            }

        }
    	}
        
    $c = 0;
    echo '</table></div><div class="panel" style="padding-top:1px; padding-left:15%;padding-right:15%;word-wrap:break-word">';
   		

   		// <h3 align="center" style="font-family:calibri">:: General Instructions ::</h3><br />
    	// <ul type="circle"><font style="font-size:14px;font-family:calibri">';
   
   	// instructions to be added if needed
    // $file = fopen("instructions.txt", "r");
    // while (!feof($file)) 
    // {
    //     echo '<li>';
    //     $string = fgets($file);
    //     $num    = strlen($string) - 1;
    //     $c      = str_split($string);
    //     for ($i = 0; $i < $num; $i++) {
    //         $last = $c[$i - 1];
    //         if ($c[$i] == ' ' && $last == ' ') {
    //             echo '&nbsp;';
    //         } else {
    //             echo $c[$i];
    //         }
    //     }
    //     echo "</li><br />";
    // }
    
    // fclose($file);
    // echo '</font></ul></div>';
    
	}
?>


<?php 
	//add code to update results/history here

	if(@$_GET['q']==2)
	{

		$q = mysqli_query($con, "SELECT * FROM history WHERE username='$username' AND status='finished' ORDER BY date DESC ") or die('Error197');
   		echo '<div class="panel title">
				<table class="table table-striped title1" >
				<tr>
				<td style="vertical-align:middle"><b>S.N.</b></td>
				<td style="vertical-align:middle"><b>Quiz</b></td>
				<td style="vertical-align:middle"><b>Total Questions</b></td>
				<td style="vertical-align:middle"><b>Correct</b></td>
				<td style="vertical-align:middle"><b>Wrong<b></td>
				<td style="vertical-align:middle"><b>Unattempted<b></td>
				<td style="vertical-align:middle"><b>Score</b></td>
				<td style="vertical-align:middle"><b>Action<b></td>
				</tr>';
    	
    	$c = 0;
    	while ($row = mysqli_fetch_array($q)) 
    	{
        	$eid = $row['eid'];
        	$s   = $row['score'];
        	$w   = $row['wrong'];
        	$r   = $row['correct'];
        	$q23 = mysqli_query($con, "SELECT * FROM quiz WHERE  eid='$eid' ") or die('Error208');
        
        	while ($row = mysqli_fetch_array($q23)) 
        	{
            $title = $row['coursetitle'];
            $total = $row['total'];
        	}

        	$c++;

        	echo '<tr>
        		<td style="vertical-align:middle">' . $c . '</td>
        		<td style="vertical-align:middle">' . $title . '</td>
        		<td style="vertical-align:middle">' . $total . '</td>
        		<td style="vertical-align:middle">' . $r . '</td>
        		<td style="vertical-align:middle">' . $w . '</td>
        		<td style="vertical-align:middle">' . ($total - $r - $w) . '</td>
        		<td style="vertical-align:middle">' . $s . '</td>
        		<td style="vertical-align:middle"><b><a href="account.php?q=result&eid=' . $eid . '" class="btn" style="margin:0px;background:darkred;color:white">&nbsp;<span class="title1"><b>View Result</b></td>
        		</tr>';
    	}
    
    	echo '</table></div>';

	}

 ?>

</body>
</html>