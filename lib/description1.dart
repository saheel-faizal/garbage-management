import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:garbage_management_system/cart.dart';


class Description1 extends StatefulWidget {
  final compost_id,compost_name,quantity,price,img,availquantity;
  Description1({this.compost_id,this.compost_name,this.quantity,this.price,this.img,this.availquantity});
  @override
  _Description1State createState() => _Description1State();
}

class _Description1State extends State<Description1> {
  get decoration => null;
  int quantitycart=1;
  String loginid,compostid,cname,quantity,price;

  Future adddata() async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    loginid=pref.getString('login_id');
    var url="http://192.168.29.222/garbage_management/Admin/api/add_cart.php";
    var data = {"compost_id":widget.compost_id,"login_id":loginid,"count":quantitycart.toString()};

    var res=await http.post(url,body: data);
    print(loginid);
  }

  @override
  void initState() {
    // TODO: implement initState
    adddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Card(
          elevation: 10,
          child: Container(

            width: 320,
            height: 450,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  width: 250,
                  height: 250,
                  padding: EdgeInsets.all(10),
                  child: Expanded(
                    child: Image.network(widget.img),
                  ),
                ),
                Divider(),
                Text(widget.compost_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                // Text('100% organic manure, oil cakes, vermicompost &  micro organisms',style: TextStyle(fontSize: 10),),
                SizedBox(height:10),
                Text('Price: \u20b9'+widget.price,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: IconButton(icon: Icon(Icons.minimize_sharp),
                        color: Colors.red,
                        onPressed: (){
                      setState(() {
                        if(quantitycart>1){
                          quantitycart--;
                        }

                      });

                    }),
                  ),
                  Text(quantitycart.toString()),
                  IconButton(color: Colors.green,
                      icon: Icon(Icons.add), onPressed: (){
                    setState(() {
                      quantitycart++;
                    });

                  })
                ],),
                SizedBox(height: 2),

                MaterialButton(
                    child: Text('Add To Cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                    color: Colors.green,
                    onPressed: (){
                      setState(() {
                        adddata();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyCart(compostid:widget.compost_id,compostname:widget.compost_name,cartquantity:quantitycart,cartprice:widget.price,cartimg:widget.img)));
                      });
                    }),

              ]
            ),
          ),
        ),
      ),
    );
  }
}
