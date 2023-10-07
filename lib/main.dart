import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:product_listtt/splash_screen.dart';
import 'data/wishlist_provider.dart';
import 'package:provider/provider.dart';
import 'data/cart_provider.dart';
import 'data/color_provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CartProvider()),
      ChangeNotifierProvider(create: (context) => WishListProvider()),
      ChangeNotifierProvider(create: (context) => CartProvider()),
      ChangeNotifierProvider(create: (context) => ColorProvider()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorProvider = context.watch<ColorProvider>();

    return Builder(builder: (context) {
      return MaterialApp(
        title: 'IEatBread',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Poppins',
            colorScheme:
                ColorScheme.fromSeed(seedColor: colorProvider.currentColor),
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
        home: SplashScreen(),
      );
    });
  }
}
