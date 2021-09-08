import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';
import 'orders_awaitingpayment_list_page.dart';
import 'orders_ongoing_list_page.dart';
import 'orders_history_list_page.dart';

class ShoppingCartBasePage extends StatefulWidget {
  @override
  _ShoppingCartBasePageState createState() => _ShoppingCartBasePageState();
}

class _ShoppingCartBasePageState extends State<ShoppingCartBasePage> {
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
                    Tab(text: "History"),
                  ])
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OrdersAwaitingPaymentListPage(),
            OrdersOngoingListPage(),
            OrdersHistoryListPage(),
          ],
        ),
      ),
    );
  }
}
