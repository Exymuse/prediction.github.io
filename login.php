<?php
include "conf_dbconnect.php";
session_start();
opendb();
date_default_timezone_set("Asia/Bangkok");


parse_str($_POST['dataForm'], $data);

$username = $data['username'];
$password = $data['password'];
$DATE_NOW = date("Y-m-d H:i:s");


$qu_check_user = querydb("SELECT username FROM master_user WHERE username = '$username' OR email = '$username' ");
if (mysqli_num_rows($qu_check_user)==0) {
	$status['status']=false;
	$status['text']='User Not Found!';
	$status['title']="Failed!";
	$status['type']="error";
	echo json_encode($status);
}
else{
	$qu_check_pass = querydb("SELECT id, username, role, status FROM master_user WHERE (username = '$username' OR email = '$username') AND password = '$password'");
	if (mysqli_num_rows($qu_check_pass)==0) {
		$status['status']=false;
		$status['text']='Wrong Username/Password';

		$status['title']="Failed!";
		$status['type']="error";
		echo json_encode($status);
	}else{
		$data = mysqli_fetch_array($qu_check_pass);
		$_SESSION['user'] = $username;
		$_SESSION['role'] = $data['role'];
		$status['title']=" Login Success!";
		$status['type']="success";
		$status['status']=true;
		$status['id']=$data['id'];
		$status['username']=$data['username'];
		$status['role']=$data['role'];
		echo json_encode($status);
		
	}
}


?>