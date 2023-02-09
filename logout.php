<?php
include "conf_dbconnect.php";
session_start();
opendb();
date_default_timezone_set("Asia/Bangkok");


session_destroy();
session_unset();
header('Location: login.html'); 


?>