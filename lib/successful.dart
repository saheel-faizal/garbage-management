import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management_system/user.dart';

class Wish extends StatefulWidget {
  @override
  _WishState createState() => _WishState();
}

class _WishState extends State<Wish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          width: 200,
          height: 150,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text("Payment Success..!",style: TextStyle(fontSize:20,color: Colors.green),
                  ),
                  ),
              SizedBox(height: 10,),

              RaisedButton(child: Icon(Icons.home,color: Colors.white,),
                  color: Colors.green[700],
                  onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserInterface()));
              })
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}



