import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BinDetail extends StatefulWidget {
  @override
  _BinDetailState createState() => _BinDetailState();
}

class _BinDetailState extends State<BinDetail> {
  Future getdata() async {
    var url = "http://192.168.29.222/garbage_management/Admin/get_bin.php";
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Bins"),
        backgroundColor: Colors.green[800],
      ),
      body: Container(

        child: FutureBuilder(
            future: getdata(),
            builder: (BuildContext context, snapshot) {
              if(snapshot.hasData){

                var data = snapshot.data;
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          child: Column(
                            children: [
                              GestureDetector(onTap: (){
                                if(snapshot.data[index]["g_status"]==null) {
                                  return showDialog(
                                      context: context, builder: (context) {
                                    return AlertDialog(

                                      title: Text('Bin'),
                                      content: Container(height: 60,
                                        decoration: BoxDecoration(color: Colors.green[200],
                                        borderRadius: BorderRadius.circular(15)),
                                        child: Center(
                                        child: Text("Bin is Empty"),),),
                                    );
                                  });
                                }else{

                                  return showDialog(
                                      context: context, builder: (context) {
                                    return AlertDialog(

                                      title: Text('Bin'),
                                      content: Container(height: 60,
                                        decoration: BoxDecoration(color: Colors.green[200],
                                        borderRadius: BorderRadius.circular(15)),
                                        child: Center(
                                        child: Text("Bin is %40"),),),
                                    );
                                  });

                                }

                              },
                                child: Container(height:100,
                                  color: Colors.white,
                                  width: MediaQuery.of(context).size.width,
                                  child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children:[
                                    Image.asset('asset/bin-2.jpg'),
                                    SizedBox(width: 10,),
                                    Text(snapshot.data[index]["g_name"]),
                                    SizedBox(width: 10,),
                                    Text(snapshot.data[index]["g_place"]),
                                    SizedBox(width: 10,),
                                    snapshot.data[index]["g_status"]==null?Text(''):Text(snapshot.data[index]["g_status"].toString()),
                                    SizedBox(width: 10,),
                                    // Text(snapshot.data[index]['g_status']),
                                  ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                );

              }else{
                return Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Container(child: Center(child: CircularProgressIndicator())),
                );
              }

            }
        ),
      ),
    );
  }
}
