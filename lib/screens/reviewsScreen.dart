import 'package:flutter/material.dart';

import 'package:restaurant/models/modelReviews.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {
              _settingModalBottomSheet(context);
            },
          ),
        ],
        title: Text(
          "Reviews",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: reviews.length,
          itemBuilder: (_, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Icon(Icons.account_circle_rounded,
                          color: Colors.grey, size: 50),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reviews[index].name,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            reviews[index].date,
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
                  child: Text(reviews[index].review),
                ),
                SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Void simpan di dalam state agar tidak perlu mengirimkan lagi context
void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Add review",
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: "Your Name",
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: "Review",
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () {},
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Simpan', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });
}
