<?php include '../connection.php';

$cArray = array();

if(isset($_POST['login_id']))
{
	$login_id = $_POST['login_id'];

	$cart_query = mysqli_query($conn, "UPDATE `cart_tb` SET `status`='success' WHERE login_id='$login_id'");

	if(mysqli_num_rows($cart_query) > 0)
	{
		while($cart_array = mysqli_fetch_assoc($cart_query))
		{
			$cArray[] = $cart_array;

		}

		$data['error']   	   = FALSE;
		$data['success'] 	   = 1;
		$data['notificationdata']  = $cArray;
		$data['message'] 	   = "history loaded!";

		echo json_encode($data);
	}

	else
	{
		$data['error'] = TRUE;
		$data['success'] = 0;
		$data['message'] = "history not found!";

		echo json_encode($data);
	}
}
else
{
	$data['error'] 	 = TRUE;
	$data['success'] = 0;
	$data['message'] = "No Access!";

	echo json_encode($data);

}

?>