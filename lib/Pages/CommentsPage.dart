

import 'package:flutter/material.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/appBar.dart';
import 'package:customer_app/bottom_navigation.dart';

class CommentsPage extends StatefulWidget {

  List<Restaurant> restaurants = [];
  int currentRestaurant;

  CommentsPage(this.restaurants, this.currentRestaurant);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: bottom_navigation(widget.restaurants, widget.currentRestaurant),

      body: Container(
          child: ListView(
            children: <Widget>[
            ],
          )
      ),
    );
  }
}
