import 'package:flutter/material.dart';
import 'package:restaurant/models/modelDrinks.dart';
import 'package:restaurant/models/modelFoods.dart';
import 'package:restaurant/screens/reviewsScreen.dart';

class DetailRestaurantScreen extends StatelessWidget {
  const DetailRestaurantScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        elevation: 0,
        title: Text(
          "Melting Pot",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                //height: 200,
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
                        "Melting Pot",
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
                            "Medan",
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
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
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
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: [
                          Icon(Icons.account_circle_rounded, color: Colors.grey, size: 50),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ahmad",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "13 November 2019",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Tidak rekomendasi untuk pelajar!",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
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
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewsScreen(),));
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
                      child: GridView.count(
                        scrollDirection: Axis.horizontal,
                        crossAxisCount: 1,
                        children: List.generate(foods.length,(index){
                          return GestureDetector(
                            child: Container(
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/img2.jpg"),
                                    SizedBox(height: 10),
                                    Text(
                                      foods[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
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
                      child: GridView.count(
                        scrollDirection: Axis.horizontal,
                        crossAxisCount: 1,
                        children: List.generate(drinks.length,(index){
                          return GestureDetector(
                            child: Container(
                              child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/img2.jpg"),
                                    SizedBox(height: 10),
                                    Text(
                                      drinks[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}