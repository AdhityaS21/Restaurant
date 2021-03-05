import 'package:restaurant/screens/detailRestaurantScreen.dart';
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
            "Restaurant",
            style: TextStyle(color: Colors.black),
          ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 35,
            padding: EdgeInsets.only(left: 18.0, right: 18.0),
            child: Container(
              padding: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Colors.black12),
              ),
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
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10.0, left: 18.0, right: 18.0),
              child: StreamBuilder<QuerySnapshot>(
                stream: firestore.collection("Restaurant").snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
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
                                      : Image.asset(
                                          'assets/restaurant1.jpg'),
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
                            Get.to(
                                DetailRestaurantScreen(
                                  restName: task['restName'],
                                  restLoc: task['restLoc'],
                                  restDesc: task['restDesc'],
                                  restFav: task['restFav'],
                                  id: document.id,
                                ),
                                transition: Transition.zoom);
                          },
                        );
                      }),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
          // Next Implement State Management!
        ],
      ),
    );
  }
}
