<?php
include 'connection.php';
session_start();
 

if(!($_SESSION['login_id']))
{
  header('location:login.php');
}

if(isset($_POST['sub']))
{
  $nm=$_POST['name'];
  $qual=$_POST['qua'];
  $rt=$_POST['rate'];
  $pic=$_FILES['images']['name'];
  //var_dump($pic);exit();
  if($pic !="")
                  {
                      $filearray=pathinfo($_FILES['images']['name']);
                      //var_dump($filearray);exit;
                      $file1=rand();
                      $file_ext=$filearray["extension"];

                          if(check_ext($file_ext))
                              {
                                    $filenew="image/".$file1.".".$file_ext;
                                    //var_dump($filenew);exit();
                                    move_uploaded_file($_FILES['images']['tmp_name'],$filenew);
                              }
                          else
                              {
                                    echo "<script> alert('please check file extension')</script>";
                              }
        
                   }
  
    mysqli_query($conn,"INSERT INTO compost_tb(c_name,quantity,available_quantity,rate,image) VALUES ('$nm','$qual','$qual','$rt','$filenew')");
   
    echo "<script>alert('New Compost Added')</script>";
 
  
}
function check_ext($f_ext)
      {
        $allowed= array('jpg','JPG','png','jpeg');
        if(in_array($f_ext,$allowed))
        {
          return true;
        }
        else
        {
          return false;
        }
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
          <h1><i class="fa fa-edit"></i>Add Compost</h1>
        
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="index.php">Dashboard</li></a>
          <li class="breadcrumb-item">Add Compost</li>
        </ul>
      </div>
      
        <div class="col-md-8 col-lg-7 ml-lg-20 ">
          <div class="tile">
            <h3 class="tile-title">Add Compost details</h3>
            <div class="tile-body">
              <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                  <label class="control-label">Name</label>
                  <input class="form-control" type="text" onclick="clr('sp1')" placeholder="Enter full name" id="name_id" name="name">
                  <span id="sp1" style="color: white;background-color: red;"></span>
                </div>
                 <div class="form-group">
                  <label class="control-label">Quantity</label>
                  <input class="form-control"  type="text" placeholder="In kg" onclick="clr('sp2')" name="qua" id="qua_id" >
                  <span id="sp2" style="color: white;background-color: red;"></span>
                </div>
                
               
              
                <div class="form-group">
                  <label class="control-label">Rate</label>
                  <input class="form-control" type="text" onclick="clr('sp6')" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, ''); this.value = this.value.replace(/(\..*)\./g, '$1');" id="rate_id" name="rate">
                  <span id="sp6" style="color: white;background-color: red;"></span>
                </div>
                 
      
                <div class="row form-group">
                <div class="col col-md-3"><label for="file-input" class=" form-control-label">Image</label></div>
                <div class="col-12 col-md-9"><input  type="file" name="images" class="form-control-file" required></div>
                </div> 
             
                
             
           
            <div class="tile-footer">
              <button class="btn btn-primary" name="sub" type="submit" onclick="return valid()"><i class="fa fa-fw fa-lg fa-check-circle"></i>ADD</button>&nbsp;&nbsp;&nbsp; 
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
        var q=document.getElementById("qua_id").value;
       
         var v=document.getElementById("rate_id").value;
         
      

        if(name=="")
        {
          document.getElementById("sp1").innerHTML="* empty field";
          return false;
        }
        if(q=="")
        {
          document.getElementById("sp2").innerHTML="* empty field";
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