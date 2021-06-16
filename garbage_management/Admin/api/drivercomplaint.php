<?php

include "../connection.php";

@$name=$_POST['names'];

@$feedback = $_POST['complaint'];


$result = mysqli_query($conn,"INSERT INTO drivercomplaint_tb (`name`,`complaint`) values ('$name','$feedback')");

if($result){
	echo "done";
}
else{
	echo "error";
}

?>		