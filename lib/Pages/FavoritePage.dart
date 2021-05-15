

import 'package:customer_app/Objects/Customer.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/data/Restaurent.dart';
import 'package:customer_app/Objects/Restaurant.dart';

class Favorite extends StatefulWidget {

  List<Restaurant> restaurants = importRestaurent();
  Customer currentCustomer;
  Favorite(this.currentCustomer);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
        ],
      )
    );
  }
}
