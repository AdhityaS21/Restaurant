import 'package:flutter/material.dart';
import 'package:restaurant/screens/homeScreen.dart';
import 'package:get/get.dart';
import 'aboutMe.dart';
import 'favoritesScreen.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitched = false, isSwitched2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.notifications_active, color: Colors.grey),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "RestaurantNotification",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Notification every 11 AM",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Colors.lightBlueAccent,
                      activeColor: Colors.blue,
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Icon(Icons.nights_stay, color: Colors.grey),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Night Mode",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Change to Night Mode",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: isSwitched2,
                      onChanged: (value) {
                        setState(() {
                          isSwitched2 = value;
                          print(isSwitched2);
                        });
                      },
                      activeTrackColor: Colors.lightBlueAccent,
                      activeColor: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            child: Container(
              width: 395,
              alignment: Alignment.bottomCenter,
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
                        child: Icon(Icons.restaurant, color: Colors.grey, size: 30),
                        onPressed: (){
                          Get.off(HomeScreen(), transition: Transition.noTransition);
                        },
                      ),
                      TextButton(
                        child: Icon(Icons.favorite, color: Colors.grey, size: 30),
                        onPressed: (){
                          Get.off(FavoritesScreen(), transition: Transition.noTransition);
                        },
                      ),
                      TextButton(
                        child: Icon(Icons.account_circle, color: Colors.grey, size: 30),
                        onPressed: (){
                          Get.off(AboutMeScreen(),transition: Transition.noTransition);
                        },
                      ),
                      TextButton(
                        child:
                            Icon(Icons.settings, color: Colors.blue, size: 30),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
