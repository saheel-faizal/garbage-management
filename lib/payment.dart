
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:garbage_management_system/CartModel.dart';
import 'package:garbage_management_system/successful.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final key=GlobalKey<FormState>();






  Future<CartList>checkout() async{
    String loginid;
    SharedPreferences pref=await SharedPreferences.getInstance();
    loginid=pref.getString('login_id');
    var url="http://192.168.29.222/garbage_management/Admin/api/checkout.php";
    var data={"login_id":loginid};
    var response=await http.post(url,body: data);
    return CartList.fromJson(jsonDecode(response.body));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text('Payment'),
      ),
      body: Container(
        child:Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white,
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(width: 100.0,),
               TextFormField(
                 validator: (value){
                   if(value.length != 16){
                     return "invalid card number";
                   }
                   return null;
                 },
                 keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Card Number',
                filled: true,
                hintStyle: TextStyle(color: Colors.black),
                border: InputBorder.none,
                  ),
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
                ),
                Divider(),
                TextFormField(
                  validator: (value){
                    if(value.length != 3){
                      return "invalid cvv ";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'CVV',
                    filled: true,
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  obscureText:true,
                ),
                Divider(),
                TextFormField(
                  validator: (value){
                    if(value.length != 5){
                      return "inavalid";
                    }
                    return null;
                  },
                  keyboardType:TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: 'Exp month/year',
                    filled: true,
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 20),
                Container(
                 child: FlatButton(
                   padding: EdgeInsets.all(10),
                     color: Colors.green,
                      child: Text('Submit',style: TextStyle(color: Colors.white),),
                      onPressed:(){
                     setState(() {
                       if(key.currentState.validate()){
                         checkout();
                         Navigator.push(context, MaterialPageRoute(builder: (context) => Wish()));

                       }


                     });

                   }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




