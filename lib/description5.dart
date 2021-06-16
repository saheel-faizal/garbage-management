
import 'package:flutter/material.dart';

import 'cart.dart';


class Description5 extends StatefulWidget {
  final compost_id;
  Description5({this.compost_id});
  @override
  _Description5State createState() => _Description5State();
}

class _Description5State extends State<Description5> {
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
                      child: Image.asset('asset/5.jpg'),
                    ),
                  ),
                  Divider(),
                  Text('Black Gold',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text('Organic soil amendment rich in micro, macronutrients & neutral pH',style: TextStyle(fontSize: 10),),
                  SizedBox(height:10),
                  Text('Price: \u20b9 350/-',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
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
