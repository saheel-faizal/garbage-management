<?php include '../Admin/connection.php';

$user_data = array();

if($_POST['username'] && $_POST['password'])
{
	@$user_name  = mysqli_real_escape_string($con, $_POST['username']);
	@$password   = mysqli_real_escape_string($con, $_POST['password']);

	$login_query = mysqli_query($conn, "SELECT * FROM login_tb WHERE username = '$user_name' AND password='$password' ");

	if(mysqli_num_rows($login_query) > 0)
	{
		$row_data = mysqli_fetch_assoc($login_query);

		
			$user_data = array('login_id' => $row_data['login_id'], 'type' => $row_data['type'], 'username' => $row_data['username']);
		
			$data['error']   = FALSE;
			$data['success'] = 1;
			$data['message'] = "Login success!";
			$data['data']	 = $user_data;
	
			echo json_encode($data);
		
	}

	else
	{
		$data['error'] = TRUE;
		$data['success'] = 0;
		$data['message'] = "Invalid username or password!";

		echo json_encode($data);
	}


}
else
{
	$data['error'] = TRUE;

	$data['success'] = 0;
	$data['message'] = "No Access!";

	echo json_encode($data);
}

?>