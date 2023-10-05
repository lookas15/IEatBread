import 'package:flutter/material.dart';
import 'data/cart_provider.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';

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
              useMaterial3: true,
              fontFamily: 'Poppins',
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
            ),
            home: const MainPage(),
          );
        }));
  }
}
