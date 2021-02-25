import 'package:restaurant/models/modelRestaurants.dart';
import 'package:restaurant/screens/aboutMe.dart';
import 'package:restaurant/screens/detailRestaurantScreen.dart';
import 'package:restaurant/screens/settingsScreen.dart';
import 'favoritesScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Restaurants",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 18.0, right: 18.0),
              // Notice Boros Widget!
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Container(
                      height: 35,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.search,
                            size: 20.0,
                          ),
                          hintText: "Search",
                        ),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              //color: Colors.grey,
              margin: EdgeInsets.only(top: 50.0, left: 18.0, right: 18.0),
              child: GridView.count(
                childAspectRatio: 3 / 5,
                crossAxisCount: 2,
                children: List.generate(restaurants.length, (index) {
                  return GestureDetector(
                    child: Container(
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/restaurant1.jpg"),
                            SizedBox(height: 10),
                            Text(
                              restaurants[index].location,
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              restaurants[index].restName,
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              restaurants[index].restDesc,
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailRestaurantScreen(),
                          ));
                    },
                  );
                }),
              ),
            ),
          ),
          // Next Implement State Management!
          Expanded(
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
                            color: Colors.blue, size: 30),
                        onPressed: () {},
                      ),
                      TextButton(
                        child:
                            Icon(Icons.favorite, color: Colors.grey, size: 30),
                        onPressed: () {
                          // Implement Route Named
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FavoritesScreen()));
                        },
                      ),
                      TextButton(
                        child: Icon(Icons.account_circle,
                            color: Colors.grey, size: 30),
                        onPressed: () {
                          // Implement Route Named
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutMeScreen()));
                        },
                      ),
                      TextButton(
                        child:
                            Icon(Icons.settings, color: Colors.grey, size: 30),
                        onPressed: () {
                          // Implement Route Named
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingsScreen()));
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
