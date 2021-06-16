
import 'package:flutter/material.dart';

import 'cart.dart';


class Description3 extends StatefulWidget {
  final compost_id;
  Description3({this.compost_id});
  @override
  _Description3State createState() => _Description3State();
}

class _Description3State extends State<Description3> {
  get decoration => null;

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
                      child: Image.asset('asset/3.jpg'),
                    ),
                  ),
                  Divider(),
                  Text('Prelite',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text('Organic soil amendment rich in micro, macronutrients & neutral pH',style: TextStyle(fontSize: 10),),
                  SizedBox(height:10),
                  Text('Price: \u20b9 670/-',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  SizedBox(height: 10),
                  Text('Quantity:-1',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),
                  SizedBox(height: 8),
                  MaterialButton(
                      child: Text('Add To Cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                      color: Colors.green,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyCart()));
                      }),

                ]
            ),
          ),
        ),
      ),
    );
  }
}
