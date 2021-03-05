import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/navigation.dart';
import 'package:restaurant/screens/reviewsScreen.dart';
import 'package:get/get.dart';

class DetailRestaurantScreen extends StatelessWidget {
  const DetailRestaurantScreen(
      {this.restLoc, this.restName, this.restDesc, this.id, this.restFav});

  final String restLoc;
  final String restName;
  final String restDesc;
  final bool restFav;
  final id;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return ChangeNotifierProvider<Navigation>(
      create: (context) => Navigation(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          title: Text(
            restName,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Image.asset("assets/restaurant1.jpg"),
                    ),
                    SizedBox(height: 10),
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              restName,
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                Icon(Icons.location_pin, size: 15),
                                SizedBox(width: 3),
                                Text(
                                  restLoc,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              "Description",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              restDesc,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[600]),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              "Reviews",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 80,
                            child: StreamBuilder<QuerySnapshot>(
                              stream: firestore
                                  .collection('Reviews')
                                  .where('restKey', isEqualTo: id)
                                  .limit(1)
                                  .snapshots(),
                              builder: (_, snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data.docs.isEmpty) {
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text("Belum ada review"),
                                    );
                                  }
                                  return ListView.builder(
                                    primary: false,
                                    shrinkWrap: false,
                                    itemCount: snapshot.data.docs.length,
                                    itemBuilder: (_, index) {
                                      DocumentSnapshot document =
                                          snapshot.data.docs[index];
                                      Map<String, dynamic> task =
                                          document.data();
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Row(
                                              children: [
                                                Icon(
                                                    Icons
                                                        .account_circle_rounded,
                                                    color: Colors.grey,
                                                    size: 50),
                                                SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      task['name'],
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    Text(
                                                      task['date'],
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey[600],
                                                      ),
                                                    ),
                                                    SizedBox(height: 5),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                            padding: EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Text(
                                              task['review'],
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
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
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: GestureDetector(
                              child: Text(
                                "Lihat Selengkapnya",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                ),
                              ),
                              onTap: () {
                                Get.to(
                                  ReviewsScreen(
                                    id: id,
                                    restName: restName,
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              "Foods",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 200,
                            padding: EdgeInsets.only(left: 18, right: 18),
                            child: StreamBuilder<QuerySnapshot>(
                              stream: firestore
                                  .collection('Foods')
                                  .where('restKey', isEqualTo: id)
                                  .snapshots(),
                              builder: (_, snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data.docs.isEmpty) {
                                    return Container(
                                      alignment: Alignment.center,
                                      child: Text("belum ada makanan"),
                                    );
                                  }
                                  return GridView.count(
                                    scrollDirection: Axis.horizontal,
                                    crossAxisCount: 1,
                                    children: List.generate(
                                        snapshot.data.docs.length, (index) {
                                      DocumentSnapshot document =
                                          snapshot.data.docs[index];
                                      Map<String, dynamic> task =
                                          document.data();
                                      return GestureDetector(
                                        child: Container(
                                          child: Card(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                (task['imgURL'] != null)
                                                    ? Image.network(
                                                        task['imgURL'])
                                                    : Image.asset(
                                                        'assets/img2.jpg'),
                                                SizedBox(height: 10),
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 8),
                                                  child: Text(
                                                    task['foodName'],
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              "Drinks",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 200,
                            padding: EdgeInsets.only(left: 18, right: 18),
                            child: StreamBuilder<QuerySnapshot>(
                              stream: firestore
                                  .collection('Drinks')
                                  .where('restKey', isEqualTo: id)
                                  .snapshots(),
                              builder: (_, snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data.docs.isEmpty) {
                                    return Container(
                                      alignment: Alignment.center,
                                      child: Text("belum ada minuman"),
                                    );
                                  }
                                  return GridView.count(
                                    scrollDirection: Axis.horizontal,
                                    crossAxisCount: 1,
                                    children: List.generate(
                                        snapshot.data.docs.length, (index) {
                                      DocumentSnapshot document =
                                          snapshot.data.docs[index];
                                      Map<String, dynamic> task =
                                          document.data();
                                      return GestureDetector(
                                        child: Container(
                                          child: Card(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                (task['imageURL'] != null)
                                                    ? Image.network(
                                                        task['imageURL'])
                                                    : Image.asset(
                                                        'assets/img2.jpg'),
                                                SizedBox(height: 10),
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 8),
                                                  child: Text(
                                                    task['drinkName'],
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 5,
                  top: 263,
                  child: StreamBuilder(
                      stream: firestore
                          .collection('Restaurant')
                          .doc(id)
                          .snapshots(),
                      builder: (_, snapshot) {
                        return Consumer<Navigation>(
                            builder: (context, provider, _) {
                          var task = snapshot.data;
                          provider.favorite = task['restFav'];
                          return FlatButton(
                            onPressed: () {
                              if (task['restFav'] == false) {
                                print(task['restFav']);
                                fav();
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content:
                                      Text('Berhasil menambahkan ke favorite'),
                                  duration: Duration(seconds: 2),
                                ));
                              } else {
                                print(task['restFav']);
                                noFav();
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content:
                                      Text('Berhasil menghapus dari favorite'),
                                  duration: Duration(seconds: 2),
                                ));
                              }
                              provider.favorite = task['restFav'];
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(provider.icon),
                            ),
                          );
                        });
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fav() {
    FirebaseFirestore.instance.collection('Restaurant').doc(id).update({
      'restFav': true,
    });
  }

  void noFav() {
    FirebaseFirestore.instance.collection('Restaurant').doc(id).update({
      'restFav': false,
    });
  }
}
