import 'package:flutter/material.dart';
import 'package:restaurant/navigation.dart';
import 'package:restaurant/screens/navigationBarScreen.dart';
import 'package:restaurant/screens/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
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
      home: ChangeNotifierProvider<Navigation>(
          create: (context) => Navigation(),
          child: NavigationBarScreen(),
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => HomeScreen(),
      //   '/favorites': (context) => FavoritesScreen(),
      // },
    );
  }
}
