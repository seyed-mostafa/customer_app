// main of the app

import 'package:flutter/material.dart';
import 'entering_customer_app.dart';

void main() => runApp(Store());

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => Entering(),
      },
    );
  }
}
