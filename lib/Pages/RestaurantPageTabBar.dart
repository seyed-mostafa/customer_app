

import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/Pages/Nav.dart';
import 'package:customer_app/Pages/RestaurantPage.dart';
import 'package:customer_app/Pages/RestaurantPage2.dart';
import 'package:flutter/material.dart';

class RestaurantPageTabBar extends StatefulWidget {

  Customer currentCustomer;
  Restaurant currentRestaurant;

  RestaurantPageTabBar(this.currentCustomer, this.currentRestaurant);

  @override
  _RestaurantPageTabBarState createState() => _RestaurantPageTabBarState();
}

class _RestaurantPageTabBarState extends State<RestaurantPageTabBar> {

  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                bottom: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(icon: Icon(Icons.fiber_manual_record),),
                    Tab(icon: Icon(Icons.food_bank),)
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(bottom: 50),
                  collapseMode: CollapseMode.parallax,
                  background: Image.asset("assets/images/food1.jpg"),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.currentRestaurant.getName()),
                      Row(
                        children: [
                          for(int i = 0; i < 5; i++)
                            Icon(Icons.star, color: theme.yellow,)
                          ,for(int i = 0; i < 5 - 5; i++)
                            Icon(Icons.star_border)
                        ],
                      )
                    ],
                  ),
                  centerTitle: true,
                ),
                expandedHeight: _size.height/3,
                pinned: true,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Nav(widget.currentCustomer))
                      );
                    }
                ),
                floating: true,
              )
            ];
          },
          body: TabBarView(
            children: [
              RestaurantPage(widget.currentCustomer, widget.currentRestaurant),
              RestaurantPage2(widget.currentCustomer, widget.currentRestaurant)
            ],
          ),
        ),
      ),
    );
  }
}
