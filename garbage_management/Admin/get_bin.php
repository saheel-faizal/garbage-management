<?php include '../Admin/connection.php';

$cArray = array();


	$compost_query = mysqli_query($conn, "SELECT * FROM garbage_tb ORDER BY garbage_id DESC");

	if(mysqli_num_rows($compost_query) > 0)
	{
		while($data=mysqli_fetch_assoc($compost_query))
		{
			$cArray[]=$cArray+$data;
		}
		echo json_encode($cArray);
	}

	else
	{
		$data['error'] = TRUE;
		$data['success'] = 0;
		$data['message'] = "Products not found!";

		echo json_encode($data);
	}



?>