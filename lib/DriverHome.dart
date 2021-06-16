import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:garbage_management_system/DriverComplaints.dart';
import 'package:garbage_management_system/bin.dart';
import 'package:garbage_management_system/main.dart';
import 'package:garbage_management_system/profile.dart';
import 'package:geocoder/geocoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart'as http;
import 'package:geocoder/geocoder.dart';
import 'dart:convert';
class DriverHome extends StatefulWidget {
  @override

  _DriverHomeState createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {

  var locationMessage;
  String latitude;
  String longitude;



  // function for getting the current location
  // but before that you need to add this permission!
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;

    // passing this to latitude and longitude strings
    latitude = "$lat";
    longitude = "$long";

    locationMessage = latitude+','+longitude;

  }

  // function for opening it in google maps

  void googleMap() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else
      throw ("Couldn't open google maps");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[100],
      appBar: AppBar(backgroundColor: Colors.green[800],
    title: Text("Driver Home"),
    centerTitle: true,
        actions:[
          IconButton(icon: Icon(Icons.location_on_outlined), onPressed: (){

             getCurrentLocation();
             googleMap();
             print(locationMessage.toString());

            // print(_position.longitude);
          })
        ]
      ),
      body: ListView(children: [
      Container(height: MediaQuery.of(context).size.height*0.35,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('asset/driverbanner.jpeg'),fit: BoxFit.fill)),),
        SizedBox(height: 20,),
        GestureDetector(
          onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>driverprofile()));
          },
          child: Container(
            height: 70,
            width: MediaQuery.of(context).size.width*0.92,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
            child: Center(child: Text("Profile",style: TextStyle(fontSize: 19,letterSpacing: 0.3,fontStyle: FontStyle.italic),)),),
        ),
        SizedBox(height: 20,),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>BinDetail()));
          },
          child: Container(
            height: 70,
            width: MediaQuery.of(context).size.width*0.92,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
            child: Center(child: Text("Bin Status",style: TextStyle(fontSize: 19,letterSpacing: 0.3,fontStyle: FontStyle.italic),)),),
        ),
        SizedBox(height: 20,),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DriverComplaints()));
          },
          child: Container(
            height: 70,
            width: MediaQuery.of(context).size.width*0.92,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
            child: Center(child: Text("Post A Complaint",style: TextStyle(fontSize: 19,letterSpacing: 0.3,fontStyle: FontStyle.italic),)),),
        ),
        SizedBox(height: 20,),
        GestureDetector(
          onTap: () async{
            Fluttertoast.showToast(msg: "Logout");
            final pref = await SharedPreferences.getInstance();
            pref.clear();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Container(
            height: 70,
            width: MediaQuery.of(context).size.width*0.92,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white),
            child: Center(child: Text("Logout",style: TextStyle(fontSize: 19,letterSpacing: 0.3,fontStyle: FontStyle.italic),)),),
        ),

    ],),);
  }




}
