
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';
import 'AwaitingPayment.dart';
import 'OngoingOrders.dart';
import 'OrdersHistory.dart';

class ShoppingCart extends StatefulWidget {

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
                    Tab(text: "Awaiting Payment"),
                    Tab(text: "Ongoing"),
                    Tab(text:"History"),
                  ]
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AwaitingPayment(),
            OngoingOrders(),
            OrdersHistory(),
          ],
        ),
      ),
    );
  }
}
