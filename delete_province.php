<?php
include "conf_dbconnect.php";
session_start();
opendb();
date_default_timezone_set("Asia/Bangkok");

$ID = $_POST['id'];
$PROVINCE = $_POST['province'];
$DATE = date("Y-m-d H:i:s");


$query_delete = querydb("DELETE FROM `master_province` WHERE `master_province`.`id` = $ID");
		$status['status']=200; //bernilai benar
		$status['title']="Success!";
		$status['type']="";
		$status['text']="Province ".$PROVINCE." succesfully deleted.";
		echo json_encode($status);



?>