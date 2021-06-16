//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:garbage_management_system/bin.dart';
// import 'package:garbage_management_system/cart.dart';
// import 'package:garbage_management_system/description1.dart';
// import 'package:garbage_management_system/description1.dart';
// import 'package:garbage_management_system/description2.dart';
// import 'package:garbage_management_system/description3.dart';
// import 'package:garbage_management_system/description4.dart';
// import 'package:garbage_management_system/description5.dart';
// import 'package:garbage_management_system/description6.dart';
// import 'package:garbage_management_system/feedback.dart';
// import 'package:garbage_management_system/main.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class UserInterface extends StatefulWidget {
//
//   String userId;
//
//   void getuser() async {
//     SharedPreferences _pref = await SharedPreferences.getInstance();
//     userId = _pref.getString('user_id');
//   }
//   @override
//   _UserInterfaceState createState() => _UserInterfaceState();
//
// }
//
// class _UserInterfaceState extends State<UserInterface> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var image;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.green[800],
//         elevation: 0,
//         title: Text("Home"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.shopping_cart_rounded),
//             onPressed: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => MyCart()));
//             },
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.all(6.0),
//           child: Column(
//             children: <Widget>[
//               Container(
//                 child: Container(
//                   height: 190,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     image: DecorationImage(
//                       image: AssetImage("asset/recycle.jpg"),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               //1st portion
//
//               SizedBox(height: 15),
//               Expanded(
//                   child: Container(
//                     child: GridView.extent(
//                       primary: false,
//                       padding: const EdgeInsets.all(16),
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                       maxCrossAxisExtent: 200.0,
//                       children: <Widget>[
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Description1()));
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(8),
//                             child: Column(
//                               children: [
//                                 Expanded(child: Image.asset('asset/1.png')),
//                                 Text(
//                                   'Bio-organic Manure',
//                                   style: TextStyle(
//                                     backgroundColor: Colors.white,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\u20b9 500/-',
//                                   style: TextStyle(
//                                     backgroundColor: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Description2()));
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(8),
//                             child: Column(
//                               children: [
//                                 Expanded(child: Image.asset('asset/2.png')),
//                                 Text(
//                                   'Premium Compost',
//                                   style: TextStyle(
//                                     backgroundColor: Colors.white,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\u20b9 250/-',
//                                   style: TextStyle(
//                                     backgroundColor: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Description3()));
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(8),
//                             child: Column(
//                               children: [
//                                 Expanded(child: Image.asset('asset/3.jpg')),
//                                 Text(
//                                   'Perlite',
//                                   style: TextStyle(
//                                     backgroundColor: Colors.white,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\u20b9 670/-',
//                                   style: TextStyle(
//                                     backgroundColor: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Description4()));
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(8),
//                             child: Column(
//                               children: [
//                                 Expanded(child: Image.asset('asset/4.jpg')),
//                                 Text(
//                                   'Black Gold',
//                                   style: TextStyle(
//                                     backgroundColor: Colors.white,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\u20b9 400/-',
//                                   style: TextStyle(
//                                     backgroundColor: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Description5()));
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(8),
//                             child: Column(
//                               children: [
//                                 Expanded(child: Image.asset('asset/5.jpg')),
//                                 Text(
//                                   'Plant Food',
//                                   style: TextStyle(
//                                     backgroundColor: Colors.white,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\u20b9 350/-',
//                                   style: TextStyle(
//                                     backgroundColor: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Description6()));
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(8),
//                             child: Column(
//                               children: [
//                                 Expanded(child: Image.asset('asset/6.png')),
//                                 // Icon(Icons.add_shopping_cart,color: Colors.black,),
//                                 Text(
//                                   'Shake N Feed',
//                                   style: TextStyle(
//                                     backgroundColor: Colors.white,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\u20b9 670/-',
//                                   style: TextStyle(
//                                     backgroundColor: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }