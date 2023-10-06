import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';
import 'data/cart_provider.dart';

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
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
                textTheme: const TextTheme(
                    headlineMedium:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    headlineSmall:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
                    displayLarge: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                    displayMedium: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    displaySmall: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    labelMedium: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ))),
            home: const MainPage(),
          );
        }));
  }
}
