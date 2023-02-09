<?php
include "conf_dbconnect.php";
opendb();
session_start();
date_default_timezone_set("Asia/Bangkok");


$queryGet = querydb("SELECT year,SUM(production) as production FROM `production` GROUP BY year");

while ($data = mysqli_fetch_array($queryGet)) {
	$year = $data['year'];
  $production = $data['production'];
  $json_response[] = array(
    "production" => $production,
    "year" => $year);
}

// Encoding array in JSON format
echo json_encode($json_response);
?>

