
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Order.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/data/Customers.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'data/Restaurent.dart';

void main() {
  List<Restaurant> restaurant=importRestaurant();
 Customer customer=importCustomer();
  print(customer.getShoppingCart()[0].getOrder()[restaurant[0].getMenu()[2]]);
 Order order=customer.getShoppingCart()[0];
 order.addFood(customer.getShoppingCart()[0].getOrder().keys.elementAt(2), 5);
  print(customer.getShoppingCart()[0].getOrder()[restaurant[0].getMenu()[2]]);



 runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
        ),
      ),
    );
  }
}
