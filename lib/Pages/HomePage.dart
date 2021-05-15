
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/data/Restaurent.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/Restaurant.dart';

class Home extends StatefulWidget {

  List<Restaurant> restaurants = importRestaurent();
  Customer currentCustomer;
  Home(this.currentCustomer);
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            child: ListView(

            )
        ),

      ],
    );
  }
}


