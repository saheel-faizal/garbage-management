<?php 
include('connection.php');

$delete_g=$_GET['delete_id'];

$delete_equipments=mysqli_query($conn,"DELETE FROM `garbage_tb` WHERE garbage_id='$delete_g'");

header('location:view_bin.php'); 



?>