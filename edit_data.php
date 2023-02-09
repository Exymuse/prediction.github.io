<?php
include "conf_dbconnect.php";
session_start();
opendb();
date_default_timezone_set("Asia/Bangkok");

$YEAR = $_POST['year'];
$PROVINCE = $_POST['province'];
$PROVINCEID = $_POST['provinceid'];
$PRODUCTION = $_POST['production'];
$DATE = date("Y-m-d H:i:s");
if (isset($YEAR) && isset($PROVINCEID) && isset($PRODUCTION)) {
	$query_edit = querydb("UPDATE `production` SET 
		`production` = '$PRODUCTION',
		`date_create` = '$DATE'
		WHERE `production`.`year` = $YEAR AND `production`.`province_id` = $PROVINCEID;");


		$status['status']=200; //bernilai benar
		$status['title']="Success!";
		$status['type']="";
		$status['text']="Production in Province ".$PROVINCE." in year ".$YEAR." edited.";
		echo json_encode($status);

	}else{
		$status['text']="Ups, Terjadi Kesalahan, Mohon Coba Lagi";
		echo json_encode($text);
	}


?>