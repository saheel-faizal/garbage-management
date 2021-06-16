<?php

include "connection.php";

@$name=$_POST['name'];
@$mobile=$_POST['mobile'];
@$email=$_POST['email'];
@$password=$_POST['password'];

$query=mysqli_query($conn,"INSERT INTO login_tb(email,password,type)values('$email','$password','2')");
$lastid=mysqli_insert_id($conn);


$query1=mysqli_query($conn,"INSERT INTO user_tb(login_id,name,mobile) VALUES('$lastid','$name','$mobile')");


if($query && $query1){
	$data["success"]=1;
	$data["message"]="successful";
	echo json_encode($data);
}
else{
	$data["success"]=0;
	$data["message"]="failed";
	echo json_encode($data);

}

?>