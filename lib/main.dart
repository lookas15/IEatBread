import 'package:flutter/material.dart';
import 'package:flutter_application/pages/HomePage.dart';

import 'pages/CartScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "IEatBread",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFFFFFF),
      ),
      routes: {
        // "/": (context) => HomePage(),
        "/": (context) => CartScreen(),
      },
    );
  }
}
