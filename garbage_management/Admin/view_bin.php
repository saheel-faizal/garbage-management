<?php 
include'connection.php';
session_start();

if(!($_SESSION['login_id']))
{
  header('location:login.php');
}


 $url = "https://api.thingspeak.com/channels/1288856/fields/1.json?api_key=XKVFWBUS99T2SVET&results=1";
 $json = file_get_contents($url);
 $json1= json_decode($json);
 $value= $json1->feeds[0]->field1;
 $vals = explode(",", $value);
 $bin_id= $vals[0];
 $status=$vals[1];
 mysqli_query($conn,"UPDATE garbage_tb SET g_status='$status' WHERE garbage_id='$bin_id' ");
 $query_gb=mysqli_query($conn,"SELECT * FROM garbage_tb ");
?>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:site" content="@pratikborsadiya">
    <meta property="twitter:creator" content="@pratikborsadiya">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title>Garbage MAnagement</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body class="app sidebar-mini">
    <!-- Navbar-->
  <?php include'header.php';?>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
  <?php include'sidebar.php';?>
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-th-list"></i>View Bin Details</h1>
         
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
          <li class="breadcrumb-item active">bin Details</li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
              <div class="table-responsive">
                <table class="table table-hover table-bordered" id="sampleTable">
                  <thead>
                    <tr>
                      <th>Name</th>
                      <th>Latitude</th>
                      <th>Longitude</th>   
                      <th>Place</th>
                      <th>Status</th>                  
                      <th>Action</th>
                      
                    </tr>
                  </thead>
                  <tbody>
                    <?php while ($row=mysqli_fetch_assoc($query_gb)) { ?>
                     
                    <tr>
                      <td><?php echo $row['g_name'];?></td>
                      <td><?php echo $row['latitude'];?></td>
                      <td><?php echo $row['longitude'];?></td>
                      <td><?php echo $row['g_place'];?></td>
                      <td><?php echo $row['g_status'];?></td>                      
                      <td><div class="btn-group-vertical" >
                        <a href="edit_bin.php?edit_id=<?php echo $row['garbage_id'];?>"  class="btn btn-primary">Edit</a>  
                          <a href="delete_bin.php?delete_id=<?php echo $row['garbage_id'];?>" onclick="confirm('Are You Sure?')" class="btn btn-danger">Delete</a>             
                          </div>
                      </td>
                       
                    </tr>
                   <?php } ?>
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <!-- Data table plugin-->
    <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
    </script>
  </body>
</html>