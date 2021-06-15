
import 'package:customer_app/Objects/Comment.dart';
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Pages/CommentsPage.dart';
import 'package:customer_app/data/Data.dart';
import 'package:flutter/cupertino.dart';

class RestaurantPage2 extends StatefulWidget {


  int currentRestaurant;
  RestaurantPage2(this.currentRestaurant);

  @override
  _RestaurantPage2State createState() => _RestaurantPage2State();
}

class _RestaurantPage2State extends State<RestaurantPage2> {

  Restaurant currentRestaurant;

  @override
  Widget build(BuildContext context) {
    currentRestaurant=Data.restaurants.elementAt(widget.currentRestaurant);
    return Container(
      //child: CommentsPage(widget.currentRestaurant),
    );
  }
}
