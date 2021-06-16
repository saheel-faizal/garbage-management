import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
class driverprofile extends StatefulWidget {
  @override
  _driverprofileState createState() => _driverprofileState();
}

class _driverprofileState extends State<driverprofile> {
  String name,username,email,phone,uid;
  final uname=TextEditingController();
  final usname=TextEditingController();
  final uemail=TextEditingController();
  final uphone=TextEditingController();

  // Future getdetails()async{
  //   SharedPreferences pref= await SharedPreferences.getInstance();
  //   uid=pref.getString('login_id');
  //   email=pref.getString('email');
  //   print(uid);
  //   print(email);
  //   var url ="http://192.168.29.222/garbage_management/Admin/api/driverprofile.php";
  //   var data={'loginid':uid};
  //   var res= await http.post(url,body:data);
  //   return jsonDecode(res.body);
  // }

  Future sharedpref() async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    uid=pref.getString('login_id');
    email=pref.getString('email');

  }

  @override
  void initState(){
    // TODO: implement initState

    sharedpref();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Driver Profile"),
        backgroundColor: Colors.green[800],
      ),
      body: FutureBuilder(future: sharedpref(),
      builder: (context,snapshot){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(radius: 85,
                backgroundImage: AssetImage('asset/avatar.png'),),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width*0.97,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.supervisor_account),
                  ),
                  SizedBox(width: 20,),
                  Text(email.toString()),
                ]),),
            ],
          ),
        );
      },)
    );
  }
}