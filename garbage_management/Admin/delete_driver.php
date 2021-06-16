<?php 
include('connection.php');

$delete_d=$_GET['delete_id'];

$delete_data=mysqli_query($conn,"DELETE FROM `driver_tb` WHERE login_id='$delete_d'");
$delete_log=mysqli_query($conn,"DELETE FROM `login_tb` WHERE login_id='$delete_d'");


header('location:view_driver.php'); 



?>