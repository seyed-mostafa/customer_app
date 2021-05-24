

import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/data/Restaurent.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/theme.dart';

import 'AwaitingPayment.dart';
import 'OngoingOrders.dart';
import 'OrdersHistory.dart';

class ShoppingCart extends StatefulWidget {

  List<Restaurant> restaurants = importRestaurent();
  final Customer currentCustomer;
  ShoppingCart(this.currentCustomer);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                    Tab(text:"History",), //,child: Row(children: [ ],),),
                    Tab(text: "Ongoing"),
                    Tab(text: "Awaiting Payment"),
                  ]
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OrdersHistory(widget.currentCustomer),
            OngoingOrders(widget.currentCustomer),
            AwaitingPayment(widget.currentCustomer),
          ],
        ),
      ),
    );
  }
}
