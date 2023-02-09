<?php
include "conf_dbconnect.php";
session_start();
opendb();
date_default_timezone_set("Asia/Bangkok");

if (empty($_SESSION)) {
	$_SESSION = null;
	echo json_encode($_SESSION);
}else{

	echo json_encode($_SESSION);
}
?>