
import 'package:customer_app/Objects/Comment.dart';
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Pages/CommentsPage.dart';
import 'package:flutter/cupertino.dart';

class RestaurantPage2 extends StatefulWidget {

  Customer currentCustomer;
  Restaurant currentRestaurant;

  RestaurantPage2(this.currentCustomer, this.currentRestaurant);

  @override
  _RestaurantPage2State createState() => _RestaurantPage2State();
}

class _RestaurantPage2State extends State<RestaurantPage2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //child: CommentsPage(widget.currentRestaurant),
    );
  }
}
