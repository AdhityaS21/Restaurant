import 'dart:async';
import 'package:flutter/material.dart';
import 'homeScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 300.0),
            Image.asset(
              "assets/icon.jpg",
              width: 100.0,
              height: 100.0,
            ),
            SizedBox(height: 300.0),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              // Strokena gede teuing uyy:v
              strokeWidth: 8,
            ),
          ],
        ),
      ),
    );
  }
}
