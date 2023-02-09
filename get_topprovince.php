<?php
include "conf_dbconnect.php";
opendb();
session_start();
date_default_timezone_set("Asia/Bangkok");

$year = $_POST['year'];
// $year = 2022;

$qtop = querydb("SELECT master_province.id, master_province.name , SUM(production.production) as totalproduction ,  AVG(production.production) as avgproduction, joined.totalproductionjoin, joined.avgproductionjoin FROM production  LEFT JOIN master_province ON master_province.id = production.province_id 
  LEFT JOIN (SELECT master_province.id as joinid, master_province.name , SUM(production.production) as totalproductionjoin, AVG(production.production) as avgproductionjoin FROM production LEFT JOIN master_province ON master_province.id = production.province_id WHERE production.year < '$year' GROUP BY province_id) as joined ON joinid = master_province.id
  WHERE production.year <= '$year'
  GROUP BY province_id  
  ORDER BY `totalproduction`  DESC LIMIT 6");

while ($data = mysqli_fetch_array($qtop)) {
  $name = $data['name'];
  $production = $data['totalproduction'];
  $productionbf = $data['totalproductionjoin'];
  $avg = $data['avgproduction'];
  $avgbf = $data['avgproductionjoin'];
  $json_response[] = array(
    "name" => $name,
    "production" => $production,
    "productionbf" => $productionbf,
    "avg" => round($avg),
    "avgbf" => round($avgbf));
}


echo json_encode($json_response);
?>

