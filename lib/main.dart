import 'package:flutter/material.dart';
import 'package:flutter_application/data/cart_provider.dart';
import 'package:flutter_application/screen/menu_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'IEatBread',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          home: const MenuList(),
        );
      } 
      )
    );
  }    
}