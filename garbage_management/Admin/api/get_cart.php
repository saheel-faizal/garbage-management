<?php include '../connection.php';

$cArray = array();

if(isset($_POST['login_id']))
{
	$login_id = $_POST['login_id'];

	// $cart_query = mysqli_query($conn, "SELECT * FROM cart_tb JOIN compost_tb ON cart_tb.compost_id=compost_tb.compost_id WHERE cart_tb.login_id='$login_id' AND status ='pending' GROUP BY compost_tb.c_name");

	$cart_query = mysqli_query($conn, "SELECT c_name, quantity,rate,image, sum(count) as `count`, cart_tb.compost_id FROM cart_tb JOIN compost_tb ON cart_tb.compost_id=compost_tb.compost_id 
	WHERE cart_tb.login_id='$login_id' AND status ='pending' GROUP BY compost_tb.c_name");

	if(mysqli_num_rows($cart_query) > 0)
	{
		while($cart_array = mysqli_fetch_assoc($cart_query))
		{
			$cArray[] = $cart_array;
			$total_amount[] = (int)$cart_array['rate'] * (int)$cart_array['count'];

		}
		$total_amount = array_sum($total_amount);
		$data['error']   	   = FALSE;
		$data['success'] 	   = 1;
		$data['notificationdata']  = $cArray;
		$data['total_amount'] = $total_amount;
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