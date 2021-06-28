

import 'dart:io';

import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/appBar.dart';
import 'package:flutter/material.dart';
import 'FavoritePage.dart';
import 'HomePage.dart';
import 'ProfilePage.dart';
import 'ShoppingCartPage.dart';

class Nav extends StatefulWidget {

  int index = 0;

  Nav(this.index);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {

  int _selectedIndex = 0;

  @override
  initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  showScreen() {
      print("here");
      if(_selectedIndex == 0){//home
        return Home();
      }else if(_selectedIndex == 1){//fav
        return Favorite();
      }else if(_selectedIndex == 2){//shop
        return ShoppingCart();
      }else {//(_selectedIndex == 3)(profile)
        return Profile();
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
