import 'package:flutter/material.dart';
import 'package:flutter_application/screen/menu_list.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IEatBread',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const MenuList(),
    );
  }
}