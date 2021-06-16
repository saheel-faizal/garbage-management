
<?php
include '../connection.php';

if(isset($_POST['login_id']))
{

  @$compost_id = mysqli_real_escape_string($conn, $_POST['compost_id']);
  @$user_id = mysqli_real_escape_string($conn, $_POST['login_id']);
  @$count = mysqli_real_escape_string($conn,$_POST['count']);
 
  $query = mysqli_query($conn, "INSERT INTO `cart_tb`(`compost_id`,`login_id`,`count`) VALUES ('$compost_id','$user_id','$count')");

    if($query)
    {
       $data['error'] = FALSE;
       $data['success'] = 1;
       $data['message'] = " Message Sent!";

       echo json_encode($data);
    }

    else
    {
      $data['error'] = TRUE;
      $data['success'] = 0;
      $data['message'] = "Error occured while sending!";

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