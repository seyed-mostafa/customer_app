

import 'package:flutter/material.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import '../EditProfile.dart';

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
    return Stack(
      children: [
        Positioned(
            height: 50,
            width: MediaQuery.of(context).size.width,
            bottom: 0,
            child: Container(
              color: Colors.black,
              child: TextButton(
                child: Text("Edit Profile"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) => EditProfile(widget.restaurants, widget.currentRestaurant)));
                },
              ),
            )
        ),
      ],

    );
  }
}