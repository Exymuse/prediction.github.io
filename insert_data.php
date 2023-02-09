<?php
include "conf_dbconnect.php";
session_start();
opendb();
date_default_timezone_set("Asia/Bangkok");

$YEAR = $_POST['year'];
$PROVINCE = $_POST['province'];
$PRODUCTION = $_POST['production'];
$DATE = date("Y-m-d H:i:s");
if (isset($YEAR) && isset($PROVINCE) && isset($PRODUCTION)) {
	$query_insert = querydb("INSERT INTO production (
		production.year,
		production.province_id,
		production.production,
		production.date_create,
		production.status) 
	VALUES(
		'$YEAR',
		'$PROVINCE',
		'$PRODUCTION',
		'$DATE',
		'1')");

		$status['status']=200; //bernilai benar
		$status['title']="Success!";
		$status['type']="success";
		$status['text']=$PROVINCE." added into database.";
		echo json_encode($status);

	}else{
		$status['text']="Ups, Terjadi Kesalahan, Mohon Coba Lagi";
		echo json_encode($text);
	}


?>