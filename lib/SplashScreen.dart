import 'dart:async';
import 'package:customer_app/Pages/Nav.dart';
import 'package:flutter/material.dart';
import 'Pages/EnteringPage.dart';
import 'package:customer_app/Objects/Customer.dart';
import 'data/Customers.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool EnteredUser = false;
  @override
  void initState() {

    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder:  EnteredUser ?
                    (BuildContext context) => Nav ():
                    (BuildContext context) => EnteringPage()
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