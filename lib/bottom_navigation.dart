
//BottomNavigationBar with change color and animation

import 'package:flutter/material.dart';


import 'Objects/Restaurant.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/Pages/CommentsPage.dart';
import 'package:customer_app/Pages/MenuPage.dart';
import 'package:customer_app/Pages/OrdersPage.dart';

class bottom_navigation extends StatefulWidget {

  List<Restaurant> restaurants = [];
  int currentRestaurant;

  bottom_navigation(this.restaurants, this.currentRestaurant);

  @override
  _bottom_navigationState createState() => _bottom_navigationState();
}
class _bottom_navigationState extends State<bottom_navigation> {
  static int _selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
      if(_selectedIndex == 0){//foodMenu
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => FoodMenu(
                  widget.restaurants,
                  widget.currentRestaurant
                )
            )
        );
      }else if(_selectedIndex == 1){//Orders
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Orders(
                widget.restaurants,
                widget.currentRestaurant
            )
            )
        );
      }else if(_selectedIndex == 2){//Comments
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CommentsPage(
                widget.restaurants,
                widget.currentRestaurant
            ))
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      unselectedItemColor: theme.black,
      items:
      const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Shopping cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: theme.yellow,
      onTap: _onItemTapped,
    );
  }
}