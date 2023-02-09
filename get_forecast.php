<?php
include "conf_dbconnect.php";
opendb();
session_start();
date_default_timezone_set("Asia/Bangkok");

// Geting the data and sum the total of production per year from database
$queryGet = querydb("SELECT year, SUM(production.production)  AS totalproduction  FROM production  GROUP BY production.year");

// declare indexing for loop and array
$i = 0;

// declare forecast variable
$data_year = array();
$data_forecast = array();

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

// declare error variable
$err_mape = array();
$mape = array();
$sqrt_rmse = array();
$rmse = array();
$mse = array();

// declare response
$json_table = array();

// loop while queryGet condition is true 
while ($data = mysqli_fetch_array($queryGet)) {

// calculate the forecast in populated data:
  // calculate average x and average y in array
  $xavg[] = (array_sum($x)/count($x));
  $yavg[] = (array_sum($y)/count($y));
  // calculate total x, y, xx, and xy;
  $xtot[] = array_sum($x);
  $ytot[] = array_sum($y);
  $xxtot[] = array_sum($xx);
  $xytot[] = array_sum($xy);
  
  // calculate b1 and b0
  $b1[] = round($xytot[$i] - (($xtot[$i] * $ytot[$i]) / $i)) / ($xxtot[$i] - (pow($xtot[$i], 2)) / $i);

  // if value b1 is null or no data populated
  if ($b1[$i]==null) {
    // return b0 as null;
    $b0[] = null;
    // return ft as null;
    $ft[] = null;
    
  }else{
    // return b0;
    $b0[] = round($yavg[$i]-(($b1[$i])*$xavg[$i]),2);
    // return ft;
    $ft[] = round($b0[$i]+($b1[$i]*($i)),2); 

  }
  // end if;

// populate data:
    // insert value into x and y;
    // calculate xx and xy;


  // insert year into array $data_year;
  $data_year[] = $data['year'];
  // insert value from totalproduction into array $y;
  $y[] = $data['totalproduction'];
  // insert x value as index n data;
  $x[] = $i;
  // calculate xx and xy;
  $xx[] = pow(($i), 2);
  $xy[] = ($i)*intval($data['totalproduction']);


  // calculate error:
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
  // end if;


  // calculate growth:
  // declare growth variable
  // find previous data actual and forecast from array then insert into variable prev; 
  $prev = array_slice($y, -2, 1);

  // calculate growth;
  $growth = ((end($y) - $prev[0])/$prev[0])*100;

  // define growth status using binary 1 is positive growth, 0 is negative growth, null for 0 growth;
  if ($growth > 0) {
    $gstat = 1;
  }else if($growth < 0){
    $gstat = 0;
  }else if($growth == 0){
    $gstat=null;
  }

  // create json response;
  $json_table[] = array(
    "data_year" => end($data_year),
    "growth" => number_format($growth, 2, ',', '.'),
    "gstat" => $gstat,
    "data_actual" => end($y),
    "data_forecast" => round(end($ft)),
    "mape" => round(end($mape),2),
    "rmse" => end($rmse));

  // create increment for index to indexing next while loop;
  $i++;
}
// end while;


  // calculate the forecast for next year:
  // calculate average x and average y in array
  // calculate total x, y, xx, and xy;
  // calculate b1 and b0
  $xavg[] = (array_sum($x)/count($x));
  $yavg[] = (array_sum($y)/count($y));
  $xtot[] = array_sum($x);
  $ytot[] = array_sum($y);
  $xxtot[] = array_sum($xx);
  $xytot[] = array_sum($xy);
  $b1[] = round(end($xytot) - ((end($xtot) * end($ytot)) / ($i))) / (end($xxtot) - (pow(end($xtot), 2)) / ($i));
  $b0[] = round(end($yavg))-((end($b1))*end($xavg));
  
  // for loop for 3 times to calculate next 3 year of forecast
  for ($c=1; $c <=3 ; $c++) { 
  // calculate current year +1;
  $data_year[] = end($data_year)+1;
  // calculate forecast for next year using previous b1 and b0;
  $ft[] = round(end($b0)+(end($b1)*(end($x)+$c)),2);

  // add into json response with error variable is zero because there is no data actual for next year;
  $json_table[] = array(
    "data_year" => end($data_year),
    "data_actual" => null,
    "data_forecast" => round(end($ft)),
    "mape" => 0,
    "rmse" => 0
  );
}
// end for;

// output json response;
echo json_encode($json_table);


?>

