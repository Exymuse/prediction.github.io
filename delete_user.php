<?php
include "conf_dbconnect.php";
session_start();
opendb();
date_default_timezone_set("Asia/Bangkok");

$ID = $_POST['id'];
$DATE = date("Y-m-d H:i:s");


$query_delete = querydb("DELETE FROM `master_user` WHERE `master_user`.`id` = $ID");
		$status['status']=200; //bernilai benar
		$status['title']="Success!";
		$status['type']="";
		$status['text']="User ".$USERNAME." succesfully deleted.";
		echo json_encode($status);



?>