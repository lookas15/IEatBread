import 'package:flutter/material.dart';
import 'package:product_listtt/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetoMain();
  }

  _navigatetoMain() async {
    await Future.delayed(
        Duration(milliseconds: 1500), () {}); // Duration for Splash Screen
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MainPage())); //Navigate to Main Page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //CONTAINER FOR LOGO
              height: 100,
              width: 100,
              color: Colors.transparent,
              child: Text(
                'Your Logo Here',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ), // PUT YOUR LOGO HERE!
            ),
            Container(
                //CONTAINER FOR TEXT BELOW LOGO
                child: Text('IEatBread',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }
}
