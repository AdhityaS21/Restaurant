import 'package:flutter/material.dart';
import 'package:restaurant/screens/detailRestaurantScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorites",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 18.0, right: 18.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: firestore
              .collection("Restaurant")
              .where("restFav", isEqualTo: true)
              .snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.docs.isEmpty) {
                return Container(
                  alignment: Alignment.center,
                  child: Text("belum ada favorite"),
                );
              }
              return GridView.count(
                childAspectRatio: 3 / 5,
                crossAxisCount: 2,
                children: List.generate(snapshot.data.docs.length, (index) {
                  DocumentSnapshot document = snapshot.data.docs[index];
                  Map<String, dynamic> task = document.data();
                  return GestureDetector(
                    child: Container(
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (task['imgURL'] != null)
                                    ? Image.network(task['imgURL'])
                                    : Image.asset('assets/restaurant1.jpg'),
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
                alignment: Alignment.center,
                child: Text("Loading ..."),
              );
            }
          },
        ),
      ),
    );
  }
}
