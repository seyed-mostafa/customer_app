import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/constants/appbar.dart';
import 'package:flutter/material.dart';
import 'favorite_pages/favorites_list_page.dart';
import 'home_pages/home_page.dart';
import 'profile_pages/profile_page.dart';
import 'shoppingcart_pages/shoppinngcart_base_page.dart';

class BasePage extends StatefulWidget {
  final int index;

  BasePage(this.index);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;

  @override
  initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  showScreen() {
    print("here");
    if (_selectedIndex == 0) {
      //home
      return HomePage();
    } else if (_selectedIndex == 1) {
      //fav
      return FavoritesListPage();
    } else if (_selectedIndex == 2) {
      //shop
      return ShoppingCartBasePage();
    } else {
      //(_selectedIndex == 3)(profile)
      return ProfilePage();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
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
