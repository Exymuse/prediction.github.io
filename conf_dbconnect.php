<?php

if (preg_match("/conf_dbconnect.php/", $_SERVER['PHP_SELF'])) {
	header("Location: index.html");
	die;
}

ini_set("display_errors", "0");

function redirect($url){
	echo "<script language='javascript'>window.location.href='".$url."'</script>";
}

function opendb() {
	global $host, $user, $pass, $dbname, $dbconnect;
	// $host = "localhost";
	// $dbname = 'id19063218_coffee4cast';
	// $user = "id19063218_admin4cast";
	// $pass = "K@4wo<&23s8jV(4B";
	
	$host = "localhost";
	$dbname = 'nandoor';
	$user = "root";
	$pass = "";
	$dbconnect = mysqli_connect($host, $user, $pass, $dbname) or die ("Gagal membuka database");
}

function querydb($query) {
	global $dbconnect;
	$result = mysqli_query($dbconnect,$query) or die("Error #".mysqli_errno($dbconnect)." ".mysqli_error($dbconnect));
	return $result;
}


?>