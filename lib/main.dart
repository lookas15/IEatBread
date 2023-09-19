import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:product_listtt/home.dart';
=======
import 'package:flutter_application/pages/HomePage.dart';

import 'pages/CartScreen.dart';
>>>>>>> ae68534 (Order cart change)

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const Home(),
=======
      title: "IEatBread",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFFFFFF),
      ),
      routes: {
        // "/": (context) => HomePage(),
        "/": (context) => CartScreen(),
      },
>>>>>>> ae68534 (Order cart change)
    );
  }
}