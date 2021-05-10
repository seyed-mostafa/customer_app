
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
    return Container(

    );
  }
}

