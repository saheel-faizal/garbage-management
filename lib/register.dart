import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garbage_management_system/task_list.dart';
import 'package:garbage_management_system/user.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
        backgroundColor: Colors.green[800],
      ),
      body: MyCustomForm(),
    );
  }
}

// ignore: must_be_immutable
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  String name,email,mobile,password;
  final _formKey = GlobalKey<FormState>();
  int _preference=1;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  register() async {
    name = nameController.text;
    email = emailController.text;
    mobile = mobileController.text;
    password = passwordController.text;

    var url = "http://192.168.29.222/garbage_management/Admin/register.php";
    var data = {
      "name": name,
      "email": email,
      "mobile": mobile,
      "password": password,
      "prefer":_preference.toString()
    };
    var res = await http.post(url, body: data);
    var message = jsonDecode(res.body);
    int success = message['success'];
    if (success == 1) {
      Fluttertoast.showToast(msg: "registration done");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserInterface()));
    } else {
      Fluttertoast.showToast(msg: "failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  SizedBox(
                    height: 50.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                        ),
                        cursorColor: Colors.black,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 50.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 50.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: mobileController,
                        decoration: InputDecoration(
                          hintText: 'Mobile',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 50.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                        ),
                        cursorColor: Colors.black,
                        obscureText: true,
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0,left: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Prefer"),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: _preference,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("User"),
                                      value: 1,
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Driver"),
                                      value: 2,
                                    ),

                                  ],
                                  onChanged: (value){
                                    setState(() {
                                      _preference = value;
                                      FocusScope.of(context).requestFocus(new FocusNode());
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 60.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        splashColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        onPressed: () {
                          if (nameController.text == "") {
                            Fluttertoast.showToast(msg: "name required");
                          } else if (emailController.text == "") {
                            Fluttertoast.showToast(msg: "email required");
                          } else if (mobileController.text == "") {
                            Fluttertoast.showToast(msg: "mobile required");
                          } else if (passwordController.text == "") {
                            Fluttertoast.showToast(msg: "password required");
                          } else {
                            register();
                          }

                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Task()));
                          //for driver put Task();
                        },
                        child: Text('Register'),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


