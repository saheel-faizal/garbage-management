<?php 

include '../connection.php';

  @$loginid = $_POST['loginid'];;

  $query=mysqli_query($conn,"SELECT * FROM `driver_tb` WHERE login_id='$loginid'");
  $result= array();

  while ($rowData= mysqli_fetch_assoc($query)) {
	$result[]= $rowData;
  }

  echo json_encode($result);


?>