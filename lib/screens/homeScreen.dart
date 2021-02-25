import 'package:restaurant/screens/aboutMe.dart';
import 'package:restaurant/screens/detailRestaurantScreen.dart';
import 'package:restaurant/screens/settingsScreen.dart';
import 'favoritesScreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Restaurants",
          style: TextStyle(
            color: Colors.black
          ),
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
              margin: EdgeInsets.only(top: 50.0, left: 18.0, right: 18.0),
              child: StreamBuilder<QuerySnapshot>(
                stream: firestore.collection("Restaurant").snapshots(),
                builder: (_, snapshot){
                  if(snapshot.hasData){
                    return GridView.count(
                    childAspectRatio: 3/5,
                    crossAxisCount: 2,
                    children: List.generate(snapshot.data.docs.length, (index){
                      DocumentSnapshot document = snapshot.data.docs[index];
                      Map<String, dynamic> task = document.data();
                      return GestureDetector(
                        child: Container(
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(task['restImg']),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    task['restLoc'],
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    task['restName'],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    task['restDesc'],
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: (){
                          Get.to(
                            DetailRestaurantScreen(
                              restName: task['restName'],
                              restLoc: task['restLoc'],
                              restDesc: task['restDesc'],
                              id: document.id,
                            ),
                            transition: Transition.zoom);
                        },
                      );
                    }),
                  );
                  }
                  else{
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),
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
                        child: Icon(Icons.restaurant, color: Colors.blue, size: 30),
                        onPressed: (){
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
                          Get.off(AboutMeScreen(), transition: Transition.noTransition);
                        },
                      ),
                      TextButton(
                        child: Icon(Icons.settings, color: Colors.grey, size: 30),
                        onPressed: (){
                          Get.off(SettingsScreen(), transition: Transition.noTransition);
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