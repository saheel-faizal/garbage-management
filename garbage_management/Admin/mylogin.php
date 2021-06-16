<?php

include "connection.php";
$jsonarray=json_decode(file_get_contents('php://input'),true); 
@$email=$_POST['email'];
@$password=$_POST['password'];

$query=mysqli_query($conn,"SELECT * FROM login_tb WHERE email = '$email' and password = '$password'");

$result=mysqli_fetch_assoc($query);



if(mysqli_num_rows($query)>0){

	$result['success']=1;
	echo json_encode($result);
}
else{
	$result['success']=0;
	echo json_encode($result);
}



?>