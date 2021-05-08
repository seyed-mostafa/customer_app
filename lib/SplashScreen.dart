import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:customer_app/Pages/HomePage.dart';
import 'Objects/Restaurant.dart';
import 'Pages/EnteringPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  List<Restaurant> restaurants = [];

  bool EnteredUser = true;
  int currentRestaurant = 0;

  @override
  void initState() {
    restaurants.add(Restaurant("name", null, "phoneNumber", "password"));
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder:  EnteredUser ?
                    (BuildContext context) => Home (restaurants, currentRestaurant):
                    (BuildContext context) => EnteringPage(restaurants)
              )
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/food2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}