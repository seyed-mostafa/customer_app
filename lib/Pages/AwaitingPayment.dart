import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/data/Restaurent.dart';
import 'package:flutter/material.dart';


class AwaitingPayment extends StatefulWidget {
  final Customer currentCustomer;

  AwaitingPayment(this.currentCustomer);

  @override
  _AwaitingPaymentState createState() => _AwaitingPaymentState();
}

class _AwaitingPaymentState extends State<AwaitingPayment> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
