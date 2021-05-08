import 'package:flutter/material.dart';
import 'package:customer_app/bottom_navigation.dart';
import 'list_view.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'appBar.dart';
import 'bottom_navigation.dart';


class MainPanel extends StatefulWidget {
  List<Restaurant> restaurants = [];
  int currentRestaurant;
  @override
  _MainPanelState createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list_view(),
      appBar: appBar(),
      bottomNavigationBar: bottom_navigation(widget.restaurants, widget.currentRestaurant),

    );
  }
}





