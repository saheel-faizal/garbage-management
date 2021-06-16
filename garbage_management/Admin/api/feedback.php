<?php

include "../connection.php";

@$name=$_POST['names'];

@$feedback = $_POST['complaint'];


$result = mysqli_query($conn,"INSERT INTO feedback_tb (`name`,`feedback`) values ('$name','$feedback')");

if($result){
	echo "done";
}
else{
	echo "error";
}

?>		