

import 'package:customer_app/Objects/Customer.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/data/Restaurent.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/theme.dart';

import 'favoriteFood.dart';
import 'favoriteRestaurant.dart';

class Favorite extends StatefulWidget {

  List<Restaurant> restaurants = importRestaurant();
  Customer currentCustomer;
  Favorite(this.currentCustomer);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                  labelColor: theme.yellow,
                  unselectedLabelColor: Colors.white,
                  indicatorColor: theme.yellow,
                  tabs: [
                    Tab(text: "Food"),
                    Tab(text: "Restaurant"),
                  ]
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            favoriteFood(widget.currentCustomer),
            favoriteRestaurant(widget.currentCustomer),
          ],
        ),
      ),
    );
  }
}
