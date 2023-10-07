import 'package:flutter/material.dart';
import 'package:ieatbread/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMain();
  }

  _navigateToMain() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textStyle = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                colorScheme.onInverseSurface,
                BlendMode.modulate,
              ),
              child: Container(
                height: 90,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icon/ieatbread_base.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Text(
              'IEatBread',
              style: textStyle.displayLarge!.copyWith(
                color: colorScheme.onInverseSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
