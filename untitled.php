<?php
include "conf_dbconnect.php";
opendb();
session_start();
date_default_timezone_set("Asia/Bangkok");


$queryGet = querydb("SELECT year, SUM(production.production) AS totalproduction  FROM production  GROUP BY production.year");
$index = 1;

//menyiapkan variabel kosong untuk array keseluruhan data tahun
$data_year = array();
//menyiapkan variabel kosong untuk array keseluruhan data actual
$data_actual = array();

//menyiapkan variabel kosong untuk array data prediksi
$data_forecast = array();

$x = array();

$rowcount=mysqli_num_rows($queryGet);


while ($data = mysqli_fetch_array($queryGet)) {
	$year = $data['year'];
	$production = $data['totalproduction'];
  $x = $index-1;
  $y = $data['totalproduction'];
  $xx = pow($x, 2);
  $xy = $x*$y;

//memasukkan data tahun ke $data_year untuk ditampilkan di grafik
  $data_year[] = $year;
  //memasukkan data actual ke $data_actual untuk ditampilkan di grafik
  $data_actual[] = $production;



  $x_tot += $index-1;
  $y_tot += $data['totalproduction'];
  $xx_tot += pow($x, 2);
  $xy_tot += $x*$y;
  $x_avg = $x_tot/$index;
  $y_avg = $y_tot/$index;

  $b1 = ($xy_tot - (($x_tot * $y_tot) / $index)) / ($xx_tot - (pow($x_tot, 2)) / $index);
  $b0 = ($y_avg)-($b1)*$x_avg;

//response hasil json baris ke 1
  $json_response1[] = array(
    "year" => $year,
    "production" => $production,
    "x" => $x,
    "y" => $y,
    "xx" => $xx,
    "xy" => $xy);

  if ($index > 2 && $index < $rowcount) {
    $year = $data['year'];
    $production = $data['totalproduction'];
    $x = $index-1;
    $y = $data['totalproduction'];
    $xx = pow($x, 2);
    $xy = $x*$y;

//memasukkan data tahun ke $data_year untuk ditampilkan di grafik
    $data_year[] = $year;
  //memasukkan data actual ke $data_actual untuk ditampilkan di grafik
    $data_actual[] = $production;


    $x_tot += $index-1;
    $y_tot += $data['totalproduction'];
    $xx_tot += pow($x, 2);
    $xy_tot += $x*$y;
    $x_avg = $x_tot/$index;
    $y_avg = $y_tot/$index;

    $b1 = ($xy_tot - (($x_tot * $y_tot) / $index)) / ($xx_tot - (pow($x_tot, 2)) / $index);
    $b0 = ($y_avg)-($b1)*$x_avg;

    //looping hasil prediksi selama 5 tahun kedepan
    for ($i=1; $i <=5 ; $i++) { 
  //menambahkan 1 tahun pada tiap forecast eg. 2022+1 = 2023, dst
      $year_forecast[$i] = $year+$i;
  //memasukkan dan menambahkan data forecast eg (b0+(b1 x (4+1)) untuk 1 tahun berikutnya, (b0+(b1 x (4+2)) untuk 2 tahun berikutnya
      $forecast[$i] = $b0+($b1*($x+$i)); 

  //menambahkan data tahun forecast ke array tahun forecast
      $data_year[] = array($year_forecast[$i]);

  //menambahkan data forecast ke array data_forecast
      $data_forecast[] = (intval($forecast[$i]));
    }
  }

  $index++;

}

//response hasil json baris ke 2
$json_response2[] = array(
  "sum_x" => $x_tot,
  "sum_y" => $y_tot,
  "sum_xx" => $xx_tot,
  "sum_xy" => $xy_tot,
  "avg_x" => $x_avg,
  "avg_y" => $y_avg,
  "b1" => $b1,
  "b0" => $b0);



//response hasil json gabungan ke 1 dan ke 2
$json_response[] = array(
  "calc" => $json_response1,
  "regr" => $json_response2,
  "data_year" => $data_year,
  "data_actual" => $data_actual,
  "data_forecast" => $data_forecast,
);

//response hasil json ba
echo json_encode($json_response);
// print_r($data_forecast);
?>

