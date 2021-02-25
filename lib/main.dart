import 'package:flutter/material.dart';
import 'package:restaurant/screens/homeScreen.dart';
import 'package:restaurant/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Restaurant());
}

class Restaurant extends StatelessWidget {
  const Restaurant({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant',
      home: HomeScreen(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => HomeScreen(),
      //   '/favorites': (context) => FavoritesScreen(),
      // },
    );
  }
}