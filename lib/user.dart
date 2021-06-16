import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garbage_management_system/bin.dart';
import 'package:garbage_management_system/cart.dart';
import 'package:garbage_management_system/description1.dart';
import 'package:garbage_management_system/description1.dart';
import 'package:garbage_management_system/description2.dart';
import 'package:garbage_management_system/description3.dart';
import 'package:garbage_management_system/description4.dart';
import 'package:garbage_management_system/description5.dart';
import 'package:garbage_management_system/description6.dart';
import 'package:garbage_management_system/feedback.dart';
import 'package:garbage_management_system/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'garbagemanagement.dart';

class UserInterface extends StatefulWidget {




  @override
  _UserInterfaceState createState() => _UserInterfaceState();
}

class _UserInterfaceState extends State<UserInterface> {
  String loginid;
  final img=['asset/3.jpg','asset/bin-2.jpg','asset/3.jpg','asset/3.jpg','asset/bin-2.jpg','asset/3.jpg','asset/bin-2.jpg','asset/3.jpg'];
  @override
  void initState() {
    getuser();
    getdata();
    // TODO: implement initState
    super.initState();
  }

  void getuser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    loginid = pref.getString('login_id');
  }


  Future getdata() async {
    var url = "http://192.168.29.222/garbage_management/Admin/get_compost.php";
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    var image;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        elevation: 0,
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyCart(cartimg: img,)));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(6.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Container(
                  height: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage("asset/recycle.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              //1st portion

              SizedBox(height: 15),
              Expanded(
                child: Container(
                  child: FutureBuilder(
                      future: getdata(),
                      builder: (BuildContext context, snapshot) {
                        if(snapshot.hasData){
                          var data = snapshot.data;
                          return GridView.builder(
                            shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 4.0
                              ),
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    child: Column(
                                      children: [
                                        Expanded(child: Image.network(Garbage.BaseURL+snapshot.data[index]['image'])),
                                        Text(snapshot.data[index]["c_name"]),
                                        Text(snapshot.data[index]["quantity"]),
                                        Text(snapshot.data[index]["rate"]),
                                      ],
                                    ),
                                    onTap: (){
                                      var imgs=Garbage.BaseURL+snapshot.data[index]['image'];
                                      print(imgs);
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                          Description1(compost_id:snapshot.data[index]["compost_id"],
                                              compost_name:snapshot.data[index]["c_name"],
                                            quantity:snapshot.data[index]["quantity"],
                                            availquantity:snapshot.data[index]['available_quantity'],
                                            price:snapshot.data[index]["rate"],
                                            img:imgs


                                          )));
                                    },
                                  ),
                                );
                              }
                          );
                        }else{
                          return Center(child: CircularProgressIndicator(),);
                        }

                      }
                   ),
                ),
              ),
            ],
          ),
        ),
      ),

      //Home side bar
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[800],
              ),
              accountName: Text("User name"),
              accountEmail: Text("Email"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange[800],
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
            ListTile(
              trailing: Image.asset('asset/bin-2.jpg', width: 30, height: 30),
              title: Text(
                "Bin",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BinDetail()));
              },
            ),
            ListTile(
              trailing: Icon(
                Icons.feedback_sharp,
                size: 20,
              ),
              title: Text(
                "Feedback",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedBack()));
              },
            ),
            SizedBox(
              height: 265,
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              trailing: Icon(
                Icons.logout,
                size: 20,
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () async{
                Fluttertoast.showToast(msg: "Logout");
                final pref = await SharedPreferences.getInstance();
                pref.clear();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
