import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garbage_management_system/DriverHome.dart';
import 'package:garbage_management_system/bin.dart';
import 'package:garbage_management_system/register.dart';
import 'package:garbage_management_system/task_list.dart';
import 'package:garbage_management_system/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(LoginPage());
}

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

void setState(Null Function() param0) {}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage1(),
    );
  }
}

class LoginPage1 extends StatefulWidget {
  @override
  _LoginPage1State createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    String email = emailController.text;
    String password = passwordController.text;

    final response = await http.post("http://192.168.29.222/garbage_management/Admin/mylogin.php",
        body: {"email": email, "password": password});
    final data = jsonDecode(response.body);
    int value = data['success'];
    String emailAPI = data['email'];
    String passwordAPI = data['password'];
    String id = data['login_id'];
    String type=data['type'];
    if (type == "2") {
      await pref.setString('email', email);
      await pref.setString('login_id', id);
      await pref.setString('type', type);
      Fluttertoast.showToast(msg: "login successful");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => UserInterface()));
    }else if(type=='1'){
    await pref.setString('email', email);
    await pref.setString('login_id', id);
    await pref.setString('type', type);
    Fluttertoast.showToast(msg: "login successful");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DriverHome()));

    }
    else {
      Fluttertoast.showToast(msg: "login failed");
    }
  }

@override
  void initState() {
    // TODO: implement initState
    usercheck();
    super.initState();
  }
  void usercheck() async {
   SharedPreferences pref=await SharedPreferences.getInstance();
   if (pref.getString('login_id') != null){
     if(pref.getString('type')=='2'){
       Navigator.pushReplacement(
           context, MaterialPageRoute(builder: (context) => UserInterface()));
     }
     else if(pref.getString('type')=='1'){
       Navigator.pushReplacement(
           context, MaterialPageRoute(builder: (context) => DriverHome()));
     }
     else{
       print('no');
     }
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            SizedBox(height: 90.0),
            Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Image.asset(
                    "asset/ICONGARB.png",
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 60.0),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
              child: TextFormField(
                controller: emailController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.black),
              ),
            ),
            Divider(),
            SizedBox(
              height: 50.0,
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                ),
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black),
              ),
            ),
            RaisedButton(
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
                splashColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onPressed: () async {
                  print(emailController);
                  print(passwordController);
                  if (emailController.text == "") {
                    Fluttertoast.showToast(msg: "Name Required");
                  // ignore: unrelated_type_equality_checks
                  } else if (passwordController.text  == ""){
                    Fluttertoast.showToast(msg: "Password Required");
                  }else{
                    login();
                  }
                  var email = emailController.text;
                  var password = passwordController.text;
                  SharedPreferences Prefs =
                      await SharedPreferences.getInstance();
                  Prefs.setString('username', email);
                  Prefs.setString('password', password);
                }),
            SizedBox(height: 20),
            FlatButton(
              child: Text('Register', style: TextStyle(color: Colors.black)),
              padding: EdgeInsets.symmetric(horizontal: 50),
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
