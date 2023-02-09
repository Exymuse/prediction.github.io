<?php
include "conf_dbconnect.php";
opendb();
session_start();
date_default_timezone_set("Asia/Bangkok");

$year = $_POST['year'];
// $year = 2022;

$qProv = querydb("SELECT id, name, latitude, longitude FROM `master_province` WHERE master_province.id IN (select production.province_id FROM production)");
while ($dprov = mysqli_fetch_array($qProv)) {
  $lat = $dprov['latitude'];
  $lng = $dprov['longitude'];

  $queryGet = querydb("SELECT production.year, production.production, master_province.id FROM `production` LEFT JOIN master_province ON master_province.id = production.province_id WHERE production.province_id = ".$dprov['id']." ORDER BY production.year");
  $index = 1;
  $data_year = array();
  $data_actual = array();
  $data_forecast = array();

  $t = array();

  $x = array();
  $y = array();
  $xx = array();
  $xy = array();

  $xtot = array();
  $ytot = array();
  $xxtot = array();
  $xytot = array();

  $xavg = array();
  $yavg = array();

  $b1 = array();
  $b0 = array();

  $ft = array();

  $err_mape = array();
  $mape = array();
  $sqrt_rmse = array();
  $rmse = array();
  $mse = array();

  $rowcount=mysqli_num_rows($queryGet);
  while ($data = mysqli_fetch_array($queryGet)) {

    $i = $index - 1;

    $data_year[] = $data['year'];
    $t[] = $index;
    $xavg[] = (array_sum($x)/count($x));
    $yavg[] = (array_sum($y)/count($y));

    $xtot[] = array_sum($x);
    $ytot[] = array_sum($y);
    $xxtot[] = array_sum($xx);
    $xytot[] = array_sum($xy);


    $b1[] = round(($xytot[$i] - (($xtot[$i] * $ytot[$i]) / $i)) / ($xxtot[$i] - (pow($xtot[$i], 2)) / $i),2);

    if ($b1[$i]==null) {
      $b0[] = null;
      $ft[] = null;

    }else{
     $b0[] = round($yavg[$i]-(($b1[$i])*$xavg[$i]),2);
     $ft[] = round($b0[$i]+($b1[$i]*($i)),2); 

   }



   $x[] = $index - 1;
   $y[] = $data['production'];
   $xx[] = pow(($index-1), 2);
   $xy[] = ($index - 1)*intval($data['production']);

   if ($ft[$i]==null) {
    $mape[] = 0;
    $rmse[] = 0;
  }else{
    $err_mape[] = abs(($ft[$i]-$y[$i])/$y[$i])*100;
    $mape[] = (array_sum($err_mape)/count($err_mape));
    $sqrt_rmse[] = pow(($ft[$i]-$y[$i]), 2);
    $rmse[]= round(sqrt(array_sum($sqrt_rmse)/count($sqrt_rmse)),2);
    $mse[]= (array_sum($sqrt_rmse)/count($sqrt_rmse));
  }

  $DATA_YEAR[] = $data['year'];

  if ($year == $data['year']) {
    $xavg[] = (array_sum($x)/count($x));
    $yavg[] = (array_sum($y)/count($y));

    $xtot[] = array_sum($x);
    $ytot[] = array_sum($y);
    $xxtot[] = array_sum($xx);
    $xytot[] = array_sum($xy);

    $b1[] = round((end($xytot) - ((end($xtot) * end($ytot)) / end($t))) / (end($xxtot) - (pow(end($xtot), 2)) / end($t)),2);
    $b0[] = round((end($yavg))-((end($b1))*end($xavg)),2);
    if (end($xtot) == 0) {
      $ft_next = null;
    }else{
      $ft_next = round(end($b0)+(end($b1)*(end($x)+1)),2);
    }
    
    $prev = array_slice($y, -2, 1);

    $growth = ((end($y) - $prev[0])/$prev[0])*100;

    if ($growth > 0) {
      $gstat = 1;
    }else if($growth < 0){
      $gstat = 0;
    }else if($growth == 0){
      $gstat=null;
    }

    $json_response[] = array(
      "id" => $dprov['id'],
      "province" => $dprov['name'],
      "year" => end($data_year),
      "production" => number_format(end($y), 0, ',', '.'),
      "l_production" => number_format(prev($y), 0, ',', '.'),
      "forecast" => number_format(end($ft), 2, ',', '.'),
      "dproduction" => end($y),
      "forecast_next" => number_format($ft_next, 2, ',', '.'),
      "growth" => number_format($growth, 2, ',', '.'),
      "gstat" => $gstat,
      "lat" => ($lat),
      "lng" => ($lng),
      "mape" => round(end($mape),2),
      "rmse" => end($rmse));
  }



  $index++;
}



}

echo json_encode($json_response);
?>

