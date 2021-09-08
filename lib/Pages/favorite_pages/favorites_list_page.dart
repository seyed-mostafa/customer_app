import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/Pages/home_pages/restaurant_base_page.dart';
import 'package:customer_app/data/Data.dart';
import 'package:flutter/material.dart';

class FavoritesListPage extends StatefulWidget {
  @override
  _FavoritesListPageState createState() => _FavoritesListPageState();
}

class _FavoritesListPageState extends State<FavoritesListPage> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    Widget showRestaurant(Restaurant restaurant, int id) {
      int index = 0;
      return TextButton(
        onPressed: () {
          for (int i = 0; i < Data.restaurants.length; i++) {
            if (id == Data.restaurants[i].getId()) {
              index = i;
            }
          }
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => RestaurantBasePage(index)));
        },
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        child: Container(
          margin: EdgeInsets.all(5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: _size.width * 0.45,
              color: theme.yellow.withOpacity(1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          spreadRadius: 3,
                          blurRadius: 15,
                          offset: Offset(0, 0))
                    ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: AspectRatio(
                        aspectRatio: 16 / 10,
                        child: Container(
                            child: Image.asset(
                          "assets/images/restaurant/" +
                              restaurant.getName() +
                              ".jpg",
                          fit: BoxFit.fill,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              restaurant.getName(),
                              style: TextStyle(
                                color: theme.black,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              restaurant.getAddress().toString(),
                              style: TextStyle(
                                color: theme.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      width: _size.width,
      child: GridView.count(crossAxisCount: 2, children: [
        for (int i = 0; i < Data.restaurants.length; i++)
          if (Data.customer
              .getFavoriteRestaurant()
              .contains(Data.restaurants[i].getId()))
            showRestaurant(Data.restaurants[i], Data.restaurants[i].getId())
      ]),
    );
  }
}
