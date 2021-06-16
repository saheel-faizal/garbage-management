<?php 
include('connection.php');

$delete_usr=$_GET['delete_id'];

$delete_log=mysqli_query($conn,"DELETE FROM `login_tb` WHERE login_id='$delete_usr'");
$delete_user=mysqli_query($conn,"DELETE FROM `user_tb` WHERE login_id='$delete_usr'");

header('location:view_user.php'); 



?>