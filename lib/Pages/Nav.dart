

import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/appBar.dart';
import 'package:flutter/material.dart';

import '../EditProfile.dart';
import 'FavoritePage.dart';
import 'HomePage.dart';
import 'ProfilePage.dart';
import 'ShoppingCartPage.dart';

class Nav extends StatefulWidget {

  List<Restaurant> restaurants = [];
  int currentRestaurant;

  Nav(this.restaurants, this.currentRestaurant);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {

  int _selectedIndex = 0;

  showScreen() {
      print("here");
      if(_selectedIndex == 0){//home
        return Home(widget.restaurants, widget.currentRestaurant);
      }else if(_selectedIndex == 1){//fav
        return Favorite(widget.restaurants, widget.currentRestaurant);
      }else if(_selectedIndex == 2){//shop
        return ShoppingCart(widget.restaurants, widget.currentRestaurant);
      }else {//(_selectedIndex == 3)(profile)
        return Profile(widget.restaurants, widget.currentRestaurant);
      }
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: theme.black,
        items: const <BottomNavigationBarItem>[
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
      ),
      body: showScreen(),
    );
  }
}
