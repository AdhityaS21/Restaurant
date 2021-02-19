import 'package:flutter/material.dart';
import 'package:restaurant/screens/favoritesScreen.dart';
import 'package:restaurant/screens/homeScreen.dart';
import 'package:restaurant/screens/settingsScreen.dart';

class AboutMeScreen extends StatefulWidget {
  AboutMeScreen({Key key}) : super(key: key);

  @override
  _AboutMeScreenState createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Me",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 180),
              Column(
                children: [
                  Text(
                    "ME",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "BANDUNG",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: FlatButton(
                      child: Row(
                        children: [
                          Image.asset("assets/linkin.png", width: 50, height: 50),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "LinkedIn",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0
                                  ),
                                ),
                                Text(
                                  "Let's Connect",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.navigate_next, color: Colors.grey, size: 40),
                        ],
                      ),
                      onPressed: (){
                      },
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 18.0),
                    child: Text(
                      "Favorite Restaurants",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "belum ada favorite",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],),
            ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 20.0),
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
                        offset: Offset(0,3),
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
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        },
                      ),
                      TextButton(
                        child: Icon(Icons.favorite, color: Colors.grey, size: 30),
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FavoritesScreen()));
                        },
                      ),
                      TextButton(
                        child: Icon(Icons.account_circle, color: Colors.blue, size: 30),
                        onPressed: (){                    
                        },
                      ),
                      TextButton(
                        child: Icon(Icons.settings, color: Colors.grey, size: 30),
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                        },
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