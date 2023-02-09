<?php
include "conf_dbconnect.php";
session_start();
opendb();
date_default_timezone_set("Asia/Bangkok");

$ID = $_POST['id'];
$PROVINCE = $_POST['province'];
$LAT = $_POST['latitude'];
$LNG = $_POST['longitude'];
$DATE = date("Y-m-d H:i:s");
if (!empty($PROVINCE)) {
	$query_edit = querydb("UPDATE `master_province` SET 
		`name` = '$PROVINCE',
		`latitude` = '$LAT', 
		`longitude` = '$LNG', 
		`date_create` = '$DATE'
		WHERE `master_province`.`id` = $ID;");


		$status['status']=200; //bernilai benar
		$status['title']="Success!";
		$status['type']="success";
		$status['text']="Province ".$PROVINCE." successfully edited.";
		echo json_encode($status);

	}else{
		$status['text']="Ups, Terjadi Kesalahan, Mohon Coba Lagi";
		echo json_encode($text);
	}


?>