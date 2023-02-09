<?php
include "conf_dbconnect.php";
opendb();
session_start();
date_default_timezone_set("Asia/Bangkok");


$queryComment = querydb("SELECT * FROM master_user");
$index = 0;
while ($data = mysqli_fetch_array($queryComment)) {
	$id = $data['id'];
	$email = $data['email'];
	$username = $data['username'];
  $password = $data['password'];
  $create_date = $data['create_date'];
  $status = $data['status'];
  $json_response[] = array(
    "id" => $id,
    "email" => $email,
    "username" => $username,
    "password" => $password,
    "create_date" => $create_date,
    "status" => $status);
}

// Encoding array in JSON format
echo json_encode($json_response);
?>

