

import 'package:flutter/material.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/appBar.dart';
import 'package:customer_app/bottom_navigation.dart';
import 'package:customer_app/EditProfile.dart';

class Profile extends StatefulWidget {

  List<Restaurant> restaurants = [];
  int currentRestaurant;

  Profile(this.restaurants, this.currentRestaurant);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: bottom_navigation(widget.restaurants, widget.currentRestaurant),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_align_justify),
    onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder:
    (context) => EditProfile(widget.restaurants, widget.currentRestaurant)));

    },
      ),
      body: Container(
          child: ListView(
            children: <Widget>[

            ],
          )
      ),
    );
  }
}