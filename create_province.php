<?php
include "conf_dbconnect.php";
session_start();
opendb();
date_default_timezone_set("Asia/Bangkok");

$PROVINCE = $_POST['province'];
$LAT = $_POST['latitude'];
$LNG = $_POST['longitude'];
$DATE = date("Y-m-d H:i:s");
if (!empty($PROVINCE)) {
	$query_insert = querydb("INSERT INTO master_province (
		master_province.name,
		master_province.latitude,
		master_province.longitude,
		master_province.date_create,
		master_province.status) 
	VALUES(
		'$PROVINCE',
		'$LAT',
		'$LNG',
		'$DATE',
		'0')");

		$status['status']=200; //bernilai benar
		$status['title']="Success!";
		$status['type']="success";
		$status['text']="Province ".$PROVINCE." added into database.";
		echo json_encode($status);

	}else{
		$status['text']="Ups, Terjadi Kesalahan, Mohon Coba Lagi";
		echo json_encode($text);
	}


?>