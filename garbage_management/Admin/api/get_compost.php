<?php include '../Admin/connection.php';

$cArray = array();

// if(isset($_POST['login_id']))
// {
	$login_id = $_POST['login_id'];

	$compost_query = mysqli_query($con, "SELECT * FROM compost_tb ORDER BY compost_id DESC");

	if(mysqli_num_rows($compost_query) > 0)
	{
		while($compost_array = mysqli_fetch_assoc($compost_query))
		{
			$cArray[] = $compost_array;

		}

		$data['error']   	   = FALSE;
		$data['success'] 	   = 1;
		$data['productsdata']  = $cArray;
		$data['message'] 	   = "Products loaded!";

		echo json_encode($data);
	}

	else
	{
		$data['error'] = TRUE;
		$data['success'] = 0;
		$data['message'] = "Products not found!";

		echo json_encode($data);
	}
// }
// else
// {
// 	$data['error'] 	 = TRUE;
// 	$data['success'] = 0;
// 	$data['message'] = "No Access!";

// 	echo json_encode($data);

// }

?>