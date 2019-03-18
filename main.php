<?php
	require("includes/conf.php");
	require("includes/functions.php");
	
	session_start();
	$db = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
	
	if (mysqli_connect_errno()) { die("Can't connect to the mysql database, please contact the administrator!"); }
	
	
?>