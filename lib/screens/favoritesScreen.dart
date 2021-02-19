import 'package:flutter/material.dart';
import 'package:restaurant/screens/aboutMe.dart';
import 'package:restaurant/screens/homeScreen.dart';
import 'package:restaurant/screens/settingsScreen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text("belum ada favorite"),
              //color: Colors.grey,
              // margin: EdgeInsets.only(left: 18.0, right: 18.0),
              // child: GridView.count(
              //   childAspectRatio: 3/5,
              //   crossAxisCount: 2,
              //   children: List.generate(restaurants.length,(index){
              //     return GestureDetector(
              //       child: Container(
              //         child: Card(
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Image.asset("assets/restaurant1.jpg"),
              //               SizedBox(height: 10),
              //               Text(
              //                 restaurants[index].location,
              //                 maxLines: 6,
              //                 overflow: TextOverflow.ellipsis,
              //                 style: TextStyle(
              //                   color: Colors.blue,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //               SizedBox(height: 10),
              //               Text(
              //                 restaurants[index].restName,
              //                 maxLines: 6,
              //                 overflow: TextOverflow.ellipsis,
              //                 style: TextStyle(
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //               SizedBox(height: 10),
              //               Text(
              //                 restaurants[index].restDesc,
              //                 maxLines: 6,
              //                 overflow: TextOverflow.ellipsis,
              //                 style: TextStyle(
              //                   color: Colors.grey[600],
              //                   fontSize: 13,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       onTap: (){
              //         Navigator.push(context, MaterialPageRoute(builder: (context) => DetailRestaurantScreen(),));
              //       },
              //     );
              //   }),
              // ),
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
                        child: Icon(Icons.restaurant, color: Colors.grey, size: 30),
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        },
                      ),
                      TextButton(
                        child: Icon(Icons.favorite, color: Colors.blue, size: 30),
                        onPressed: (){
                        },
                      ),
                      TextButton(
                        child: Icon(Icons.account_circle, color: Colors.grey, size: 30),
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AboutMeScreen()));
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