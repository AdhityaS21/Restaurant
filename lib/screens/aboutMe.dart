import 'package:flutter/material.dart';
import 'package:restaurant/screens/detailRestaurantScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AboutMeScreen extends StatefulWidget {
  AboutMeScreen({Key key}) : super(key: key);

  @override
  _AboutMeScreenState createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Me",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 18.0, right: 18.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              "Agung S",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Bandung",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
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
                                fontSize: 17.0),
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
                onPressed: () {},
              ),
            ),
            SizedBox(height: 15),
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
            SizedBox(height: 15),
            Container(
              height: 450,
              child: StreamBuilder<QuerySnapshot>(
                stream: firestore
                    .collection("Restaurant")
                    .where("restFav", isEqualTo: true)
                    .snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.docs.isEmpty) {
                      return Container(
                        child: Text("belum ada favorite"),
                      );
                    }
                    return GridView.count(
                      childAspectRatio: 3 / 5,
                      crossAxisCount: 2,
                      children:
                          List.generate(snapshot.data.docs.length, (index) {
                        DocumentSnapshot document =
                            snapshot.data.docs[index];
                        Map<String, dynamic> task = document.data();
                        return GestureDetector(
                          child: Container(
                            child: Card(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  (task['imgURL'] != null)
                                    ? Image.network(task['imgURL'])
                                    : Image.asset('assets/restaurant1.jpg'),
                                  SizedBox(height: 10),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 8, right: 8),
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
                                    padding:
                                        EdgeInsets.only(left: 8, right: 8),
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
                                    padding:
                                        EdgeInsets.only(left: 8, right: 8),
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
                          onTap: () {
                            Get.to(DetailRestaurantScreen(
                              restName: task['restName'],
                              restLoc: task['restLoc'],
                              restDesc: task['restDesc'],
                              restFav: task['restFav'],
                              id: document.id,
                            ));
                          },
                        );
                      }),
                    );
                  } else {
                    return Container(
                      child: Text("Loading ..."),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
