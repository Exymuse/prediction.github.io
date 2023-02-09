<?php
include "conf_dbconnect.php";
session_start();
opendb();
date_default_timezone_set("Asia/Bangkok");

$EMAIL = $_POST['email'];
$USERNAME = $_POST['username'];
$PASSWORD = $_POST['password'];
$DATE = date("Y-m-d H:i:s");
if (!empty($EMAIL) && !empty($USERNAME) && !empty($PASSWORD)) {
	$query_insert = querydb("INSERT INTO master_user (
		master_user.email,
		master_user.username,
		master_user.password,
		master_user.create_date,
		master_user.create_by,
		master_user.status) 
	VALUES(
		'$EMAIL',
		'$USERNAME',
		'$PASSWORD',
		'$DATE',
		'admin',
		'0')");

		$status['status']=200; //bernilai benar
		$status['title']="Success!";
		$status['type']="success";
		$status['text']="User ".$USERNAME." added into database.";
		echo json_encode($status);

	}else{
		$status['text']="Ups, Terjadi Kesalahan, Mohon Coba Lagi";
		echo json_encode($text);
	}


?>