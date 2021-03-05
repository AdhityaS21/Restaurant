import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/screens/aboutMe.dart';
import 'package:restaurant/screens/favoritesScreen.dart';
import 'package:restaurant/screens/homeScreen.dart';
import 'package:restaurant/screens/settingsScreen.dart';
import '../navigation.dart';

class NavigationBarScreen extends StatelessWidget {
  const NavigationBarScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var body = [
      HomeScreen(),
      FavoritesScreen(),
      AboutMeScreen(),
      SettingsScreen(),
    ];
    return Scaffold(
      body: Consumer<Navigation>(builder: (context, provider, _) {
        return Stack(
          children: [
            body[provider.currentIndex],
            Positioned(
              bottom: 5,
              child: Container(
                alignment: Alignment.bottomCenter,
                width: 395,
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Container(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          child: Icon(Icons.restaurant,
                              color: (provider.selectedIndex1) ? Colors.blue: Colors.grey, size: 30),
                          onPressed: () {
                            int index = 0;
                            provider.currentIndex = index;
                            provider.selectedIndex1 = true;
                            provider.selectedIndex2 = false;
                            provider.selectedIndex3 = false;
                            provider.selectedIndex4 = false;
                          },
                        ),
                        TextButton(
                          child: Icon(Icons.favorite,
                              color: (provider.selectedIndex2) ? Colors.blue: Colors.grey, size: 30),
                          onPressed: () {
                            int index = 1;
                            provider.currentIndex = index;
                            provider.selectedIndex2 = true;
                            provider.selectedIndex1 = false;
                            provider.selectedIndex3 = false;
                            provider.selectedIndex4 = false;
                          },
                        ),
                        TextButton(
                          child: Icon(Icons.account_circle,
                              color: (provider.selectedIndex3) ? Colors.blue: Colors.grey, size: 30),
                          onPressed: () {
                            int index = 2;
                            provider.currentIndex = index;
                            provider.selectedIndex3 = true;
                            provider.selectedIndex1 = false;
                            provider.selectedIndex2 = false;
                            provider.selectedIndex4 = false;
                          },
                        ),
                        TextButton(
                          child: Icon(Icons.settings,
                              color: (provider.selectedIndex4) ? Colors.blue: Colors.grey, size: 30),
                          onPressed: () {
                            int index = 3;
                            provider.currentIndex = index;
                            provider.selectedIndex4 = true;
                            provider.selectedIndex3 = false;
                            provider.selectedIndex2 = false;
                            provider.selectedIndex1 = false;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
