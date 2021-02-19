import 'package:flutter/material.dart';
// import 'package:restaurant/screens/favoritesScreen.dart';
// import 'package:restaurant/screens/homeScreen.dart';
import 'package:restaurant/screens/splashScreen.dart';

void main() => runApp(Restaurant());

class Restaurant extends StatelessWidget {
  const Restaurant({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant',
      home: SplashScreen(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => HomeScreen(),
      //   '/favorites': (context) => FavoritesScreen(),
      // },
    );
  }
}