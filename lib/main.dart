import 'package:flutter/material.dart';
import 'package:product_listtt/data/cart_provider.dart';
import 'package:product_listtt/screens/menu_list.dart';
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
        }));
  }
}
