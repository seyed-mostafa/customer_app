

import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/data/Restaurent.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/Restaurant.dart';

class ShoppingCart extends StatefulWidget {

  List<Restaurant> restaurants = importRestaurent();
  Customer currentCustomer;
  ShoppingCart(this.currentCustomer);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("this is shoppingCart page"),
    );
  }
}
