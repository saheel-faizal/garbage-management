
import 'package:flutter/material.dart';
import 'package:garbage_management_system/payment.dart';

class cartdisplay extends StatefulWidget {
  @override
  _cartdisplayState createState() => _cartdisplayState();
}

class _cartdisplayState extends State<cartdisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Column(
          children: [
            Text("My cart"),
            // Text("items 2",style: TextStyle(fontSize: 10),textAlign: TextAlign.left,),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 18.0),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          image:DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("asset/1.png"),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 100.0,
                          child: Text('Bio organic manure ',
                            style: TextStyle(fontWeight:FontWeight.bold,fontSize: 15
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: <Widget>[

                            Spacer(),
                            Text("\u20b9 500/-",
                              style: TextStyle(fontWeight:FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),



            SizedBox(height: 18.0),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          image:DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("asset/2.png"),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 100.0,
                          child: Text('Premium Compost',
                            style: TextStyle(fontWeight:FontWeight.bold,fontSize: 15
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: <Widget>[

                            Spacer(),
                            Text("\u20b9 250/-",
                              style: TextStyle(fontWeight:FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),



            SizedBox(height: 18.0),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          image:DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("asset/6.png"),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        Container(
                          width: 100.0,
                          child: Text('Shake N Feed ',
                            style: TextStyle(fontWeight:FontWeight.bold,fontSize: 15
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: <Widget>[

                            Spacer(),
                            Text("\u20b9 670/-",
                              style: TextStyle(fontWeight:FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),

            Divider(),

            SizedBox(height: 18.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Total",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                ),
                Text("\u20b9 1420.00",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                ),
              ],
            ),
            // SizedBox(height: 18.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Delivery Charge",style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
                ),
                Text("\u20b9 30.00",style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Sub Total",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
                ),
                Text("\u20b9 1450.00",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                ),
              ],
            ),
            Spacer(),
            MaterialButton(

              color: Colors.green,
              height: 40.0,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              onPressed:(){Navigator.push(context,MaterialPageRoute(builder: (context) => Payment()));},
              child: Text('PROCEED TO CHECKOUT',style: TextStyle(color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
