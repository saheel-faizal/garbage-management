 <?php
include('connection.php');
session_start();
if(isset($_SESSION['login_id']))
{
  header("location:index.php");  
}

if(isset($_POST['login']))
{
$username=$_POST['username'];
$password=$_POST['password'];
$query=mysqli_query($conn,"SELECT * from login_tb where email='$username' and password='$password'");
$result=mysqli_fetch_assoc($query);
if(mysqli_num_rows($query)>0)
{

    
    $role=$result['type'];


        if($role=='0')
          {
              $_SESSION['login_id']=$result['login_id'];
              $_SESSION['type']=$result['type'];
              header("location:index.php");
          } 
          

        
}
 else
          {
             echo "<script>alert('invalid username or password')</script>";
          }  
}

?>












<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Log In</title>
  </head>
  <body>
    <section class="material-half-bg">
      <div class="cover"></div>
    </section>
    <section class="login-content">
      <div class="logo">
        <h1>Garbage MAnagement</h1>
      </div>
      <div class="login-box">
        <form class="login-form" method="post">
          <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>LOGIN</h3>
          <div class="form-group">
            <label class="control-label">USERNAME</label><span style="color: white; background-color: red; border-radius: 0.2em;" id="spname"></span>
            <input class="form-control" type="text" placeholder="username" name="username" id="uname_id" onkeyup="clrmsg('spname')" autofocus>
          </div>
          <div class="form-group">
            <label class="control-label">PASSWORD</label><span style="color: white; background-color: red; border-radius: 0.2em;" id="sppass"></span>
            <input class="form-control" type="password" placeholder="Password" name="password" id="pass_id" onkeyup="clrmsg('sppass')">
          </div>
          <div class="form-group">
            
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block" type="submit" onclick="return validate()" name="login"><i class="fa fa-sign-in fa-lg fa-fw"></i>LOG IN</button>
          </div>
        </form>
       
      </div>
    </section>
    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <script type="text/javascript">
      // Login Page Flipbox control
      $('.login-content [data-toggle="flip"]').click(function() {
      	$('.login-box').toggleClass('flipped');
      	return false;
      });
    </script>

     <script>
        function validate()
        {
            var name=document.getElementById("uname_id").value;
            var pass=document.getElementById("pass_id").value;

            if(name=="")
            {
                document.getElementById('spname').innerHTML="* empty field";
                return false;
            }
              if(pass=="")
            {
                document.getElementById('sppass').innerHTML="* empty field";
                return false;
            }

        }
        function clrmsg(p)
        {
            document.getElementById(p).innerHTML="";
        }
    </script>

  </body>
</html>