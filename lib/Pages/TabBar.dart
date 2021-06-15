import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Food.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/Pages/MenuPage.dart';
import 'package:customer_app/Pages/MenuType.dart';
import 'package:customer_app/Pages/RestaurantPage.dart';
import 'package:flutter/material.dart';

class tabBar extends StatefulWidget {

  Customer currentCustomer;
  Restaurant currentRestaurant;

  tabBar(this.currentCustomer, this.currentRestaurant);

  @override
  _tabBarState createState() => _tabBarState();
}

class _tabBarState extends State<tabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 11,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                  labelColor: Colors.white,
                  indicatorColor: theme.yellow,
                  isScrollable: true,
                  tabs: [
                    Tab(child: Row(children: [Icon(Icons.all_inbox_sharp), Text(" All Food")],),),
                    //if(widget.currentRestaurant.getTypeFoods().contains(TypeFood.Pizza))
                    Tab(child: Row(children: [Icon(Icons.local_pizza), Text(" Pizza")],),),
                    Tab(child: Row(children: [Icon(Icons.fastfood), Text(" Sandwich")],),),
                    Tab(child: Row(children: [Icon(Icons.free_breakfast_outlined), Text(" Drinks")],),),
                    Tab(child: Row(children: [Icon(Icons.food_bank_rounded), Text(" Persian Food")],),),
                    Tab(child: Row(children: [Icon(Icons.no_food_outlined), Text(" Dessert")],),),
                    Tab(child: Row(children: [Icon(Icons.fastfood_outlined), Text(" Appetizer")],),),
                    Tab(child: Row(children: [Icon(Icons.local_fire_department_outlined), Text(" Fried")],),),
                    Tab(child: Row(children: [Icon(Icons.set_meal), Text(" Steak")],),),
                    Tab(child: Row(children: [Icon(Icons.breakfast_dining), Text(" Breakfast")],),),
                    Tab(child: Row(children: [Icon(Icons.food_bank_rounded), Text(" International")],),),
                  ]
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Menu( widget.currentRestaurant),
            MenuType( widget.currentRestaurant, TypeFood.Pizza),
            MenuType( widget.currentRestaurant, TypeFood.Sandwich),
            MenuType( widget.currentRestaurant, TypeFood.Drinks),
            MenuType( widget.currentRestaurant, TypeFood.PersianFood),
            MenuType( widget.currentRestaurant, TypeFood.Dessert),
            MenuType( widget.currentRestaurant, TypeFood.Appetizer),
            MenuType( widget.currentRestaurant, TypeFood.Fried),
            MenuType( widget.currentRestaurant, TypeFood.Steaks),
            MenuType( widget.currentRestaurant, TypeFood.Breakfast),
            MenuType( widget.currentRestaurant, TypeFood.International),
          ],
        ),
      ),
    );
  }
}
