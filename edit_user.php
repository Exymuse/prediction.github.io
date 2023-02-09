<?php
include "conf_dbconnect.php";
session_start();
opendb();
date_default_timezone_set("Asia/Bangkok");

$ID = $_POST['id'];
$EMAIL = $_POST['email'];
$USERNAME = $_POST['username'];
$PASSWORD = $_POST['password'];
$DATE = date("Y-m-d H:i:s");
if (!empty($EMAIL) && !empty($USERNAME) && !empty($PASSWORD)) {
	$query_edit = querydb("UPDATE `master_user` SET 
		`email` = '$EMAIL', 
		`username` = '$USERNAME', 
		`password` = '$PASSWORD',
		 `create_date` = '$DATE'
		WHERE `master_user`.`id` = $ID;");


		$status['status']=200; //bernilai benar
		$status['title']="Success!";
		$status['type']="";
		$status['text']="User ".$USERNAME." edit into database.";
		echo json_encode($status);

	}else{
		$status['text']="Ups, Terjadi Kesalahan, Mohon Coba Lagi";
		echo json_encode($text);
	}


?>