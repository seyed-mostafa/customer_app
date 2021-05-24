
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/data/Restaurent.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/theme.dart';




import 'package:customer_app/Objects/Customer.dart';

class OrdersHistory extends StatefulWidget {
  final Customer currentCustomer;

  OrdersHistory(this.currentCustomer);

  @override
  _OrdersHistoryState createState() => _OrdersHistoryState();
}

class _OrdersHistoryState extends State<OrdersHistory> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
