import 'package:customer_app/appBar.dart';
import 'package:customer_app/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/Restaurant.dart';



class Home extends StatefulWidget {

  List<Restaurant> restaurants = [];
  int currentRestaurant;
  Home(this.restaurants, this.currentRestaurant);
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: bottom_navigation(widget.restaurants,widget.currentRestaurant),
    );
  }
}

