<?php
include 'connection.php';
session_start();

 $id=$_GET['edit_id'];
 $query=mysqli_query($conn,"SELECT * FROM driver_tb WHERE login_id='$id'");
 $data=mysqli_fetch_assoc($query);
 

if(!($_SESSION['login_id']))
{
  header('location:login.php');
}

if(isset($_POST['sub']))
{
  $nm=$_POST['name'];
  $mb=$_POST['mob'];
  $ml=$_POST['mail'];
  $add=$_POST['address'];    
  $ve=$_POST['vehi'];   
 
   

    mysqli_query($conn,"UPDATE  driver_tb SET d_name='$nm',d_email='$ml',d_address='$add',vehicle_no='$ve',d_mobile='$mb'");
    echo "<script>alert('Driver Details Updated')</script>";
    echo "<script>window.location.href='view_driver.php'</script>";
 

  
}




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
    <style type="text/css">
   
    </style>
  </head>
  <body class="app sidebar-mini">
    <!-- Navbar-->
   <?php include'header.php'?>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
   <?php include'sidebar.php';?>
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i>Edit Driver</h1>
        
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="index.php">Dashboard</li></a>
          <li class="breadcrumb-item">Edit Driver</li>
        </ul>
      </div>
      
        <div class="col-md-8 col-lg-7 ml-lg-20 ">
          <div class="tile">
            <h3 class="tile-title">Edit Driver details</h3>
            <div class="tile-body">
              <form method="post">
                <div class="form-group">
                  <label class="control-label">Name</label>
                  <input class="form-control" type="text" onclick="clr('sp1')" value="<?php echo $data['d_name'];?>" placeholder="Enter full name" id="name_id" name="name">
                  <span id="sp1" style="color: white;background-color: red;"></span>
                </div>
                 <div class="form-group">
                  <label class="control-label">Mobile</label>
                  <input class="form-control"  type="text" onclick="clr('sp2')" value="<?php echo $data['d_mobile'];?>" name="mob" id="phone_id" >
                  <span id="sp2" style="color: white;background-color: red;"></span>
                </div>
                 <div class="form-group">
                  <label class="control-label">Email    </label>
                  <input class="form-control" type="email" onclick="clr('sp3')" value="<?php echo $data['d_email'];?>" name="mail" id="email_id" >
                  <span id="sp3" style="color: white;background-color: red;"></span>
                </div>
               
               
                <div class="form-group">
                  <label class="control-label">Vehicle No</label>
                  <input class="form-control" type="text" onclick="clr('sp6')" value="<?php echo $data['vehicle_no'];?>" placeholder="Enter Vehicle No" id="v_id" name="vehi">
                  <span id="sp6" style="color: white;background-color: red;"></span>
                </div>
                 
      
                 
             
                
             
           
            <div class="tile-footer">
              <button class="btn btn-primary" name="sub" type="submit" onclick="return valid()"><i class="fa fa-fw fa-lg fa-check-circle"></i>UPDATE</button>&nbsp;&nbsp;&nbsp; 
            </div>
             </form>
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
    <script>
      function valid()
      {
        var name=document.getElementById("name_id").value;
        var ph=document.getElementById("phone_id").value;
        var mail=document.getElementById("email_id").value;
         var v=document.getElementById("v_id").value;
         

        if(name=="")
        {
          document.getElementById("sp1").innerHTML="* empty field";
          return false;
        }
        if(ph=="")
        {
          document.getElementById("sp2").innerHTML="* empty field";
          return false;
        }
        if(mail=="")
        {
          document.getElementById("sp3").innerHTML="* empty field";
          return false;
        }
     
        
        if(v=="")
        {
          document.getElementById("sp6").innerHTML="* empty field";
          return false;
        }
         
       
      }
      function clr(p){
        document.getElementById(p).innerHTML="";
      }
    </script>
  </body>
</html>