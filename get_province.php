<?php
include "conf_dbconnect.php";
opendb();
session_start();
date_default_timezone_set("Asia/Bangkok");

$year = $_POST['year'];
if (!empty($year)) {
  $queryGet = querydb("SELECT * FROM `master_province` WHERE master_province.id NOT IN (SELECT production.province_id FROM production WHERE production.year = '$year')");
}else if(empty($year)){
  $queryGet = querydb("SELECT * FROM master_province");
}

$index = 0;
while ($data = mysqli_fetch_array($queryGet)) {
	$id = $data['id'];
	$province = $data['name'];
  $lat = $data['latitude'];
  $lng = $data['longitude'];
  $date_create = $data['date_create'];
  $status = $data['status'];
  $json_response[] = array(
    "id" => $id,
    "province" => $province,
    "lat" => $lat,
    "lng" => $lng,
    "date_create" => $date_create,
    "status" => $status);
}

// Encoding array in JSON format
echo json_encode($json_response);
?>

