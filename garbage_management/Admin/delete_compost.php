<?php 
include('connection.php');

$delete_com=$_GET['delete_id'];

$delete_compost=mysqli_query($conn,"DELETE FROM `compost_tb` WHERE compost_id='$delete_com'");

header('location:view_compost.php'); 



?>