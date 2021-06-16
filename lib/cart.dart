
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garbage_management_system/CartModel.dart';
import 'package:garbage_management_system/garbagemanagement.dart';
import 'package:garbage_management_system/payment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MyCart extends StatefulWidget {
  final compostid,compostname,cartquantity,cartprice,cartimg;
  MyCart({this.compostid,this.compostname,this.cartimg,this.cartquantity,this.cartprice});
  @override

  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  String loginid;
  int total=0;



  Future<CartList>getcart() async{
    String loginid;
    SharedPreferences pref=await SharedPreferences.getInstance();
    loginid=pref.getString('login_id');
    var url="http://192.168.29.222/garbage_management/Admin/api/get_cart.php";
    var data={"login_id":loginid};
    var response=await http.post(url,body: data);
    return CartList.fromJson(jsonDecode(response.body));
  }


  Future gettotal() async{
    String loginid;
    SharedPreferences pref=await SharedPreferences.getInstance();
    loginid=pref.getString('login_id');
    var url="http://192.168.29.222/garbage_management/Admin/api/get_cart.php";
    var data={"login_id":loginid};
    var response=await http.post(url,body: data);
    return CartList.fromJson(jsonDecode(response.body));
  }


  @override
  void initState() {
    // TODO: implement initState
    getcart();
    print(loginid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Column(
          children: [
            Text("My cart"),
            // Text("items 2",style: TextStyle(fontSize: 10),textAlign: TextAlign.left,),
          ],
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          FutureBuilder(
            future: getcart(),
              builder: (context,snapshot){
              if(snapshot.hasData){
                List<Notificationdatum> arr= snapshot.data.notificationdata;
                return ListView.builder(physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                    itemCount: arr.length,
                    itemBuilder: (context,index){
                      print(loginid);
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(height: 70,
                              decoration: BoxDecoration(color: Colors.white,
                              borderRadius: BorderRadius.circular(18)),
                              child: ListTile(leading:CircleAvatar(backgroundColor: Colors.white,backgroundImage: NetworkImage(Garbage.BaseURL+arr[index].image),),
                                title: Text(arr[index].cName.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                              trailing: Container(
                                  child: Padding(
                                padding: const EdgeInsets.only(top:10),
                                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('+  '+arr[index].count.toString()),
                                    Text('₹'+arr[index].rate.toString()+'/-',style: TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              )),),
                            ),
                          ),

                          SizedBox(height: 15,),


                        ],
                      );
                    });

              }else{
                return Center(child: CircularProgressIndicator());
              }


          }),

          FutureBuilder(
            future: gettotal(),
            builder: (context,snapshot){
              return ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                  itemBuilder: (context,index){
                  return Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(height: 90,
                            decoration:BoxDecoration(borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white),

                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text('Total',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(snapshot.data.totalAmount.toString()+'/-',style: TextStyle(fontWeight: FontWeight.bold)),
                                    )

                                  ],),

                              ],)
                        ),
                      ),

                    ],);



              });
            },

          ),








          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                print(loginid);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment()));
              },
              child: Container(height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(19),
                color: Colors.green),
                child: Center(child: Text('Proceed to checkout',style: TextStyle(color: Colors.white,fontSize: 17),)),),
            ),
          )


    ]
      ),
    );
  }
}
