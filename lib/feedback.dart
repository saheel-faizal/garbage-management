
import 'package:flutter/material.dart';
import 'package:garbage_management_system/user.dart';
import 'package:http/http.dart' as http;

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final key = GlobalKey<FormState>();
  var nameCon= new TextEditingController();
  var compCon= new TextEditingController();


  String name,comp;
  SaveData(String name,String comp) async{
    var url = "http://192.168.29.223/garbage_management/Admin/api/feedback.php";
    var data = {"names":name,"complaint":comp};
    var res = await http.post(url,body: data);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          width: 330,
          height: 500,
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: SingleChildScrollView(
            child: Form(key: key,
              child: Column(
                children: [
                  SizedBox(height: 20),
                    Text('FeedBack',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
                    Container(height: 70,
                      width: 280,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.black),
                      ),
                      child: TextFormField(controller: nameCon,
                        validator: (value){
                          if(value.isEmpty){
                            return "field is empty";

                          }else{
                            return null;
                          }
                        },
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: InputBorder.none

                      ),),
                    ),
                    Container(
                      width: 280,
                      height: 250,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children:[ TextFormField(
                              controller: compCon,
                              validator: (value){
                                if(value.isEmpty){
                                  return "field is empty";

                                }else{
                                  return null;
                                }
                              },
                              maxLines:8,
                              decoration: InputDecoration(
                                hintText: "Write Something.........",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                border: InputBorder.none,
                              ),
                              cursorColor: Colors.black,
                            ),

                           ],
                          ),
                        ],
                      ),
                    ),
                  FlatButton(
                    color: Colors.grey,
                    child: Text('Submit',style: TextStyle(color: Colors.white),),
                    onPressed: (){
                      setState(() {
                        name= nameCon.text;
                        comp= compCon.text;
                        if(key.currentState.validate()){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>UserInterface()));
                        }
                      });
                      SaveData(name,comp);
                    },),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
