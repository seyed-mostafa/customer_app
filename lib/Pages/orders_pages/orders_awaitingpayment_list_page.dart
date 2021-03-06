import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Pages/orders_pages/order_awaitingpayment_detail_page.dart';
import 'package:customer_app/data/Data.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/constants/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrdersAwaitingPaymentListPage extends StatefulWidget {
  @override
  _OrdersAwaitingPaymentListPageState createState() =>
      _OrdersAwaitingPaymentListPageState();
}

class _OrdersAwaitingPaymentListPageState
    extends State<OrdersAwaitingPaymentListPage> {
  Customer currentCustomer = Data.customer;

  detailAndDelete(index) {
    return Row(
      children: [
        IconButton(
            icon: Icon(
              FontAwesomeIcons.trashAlt,
              size: 22,
              color: theme.red2,
            ),
            onPressed: () {
              setState(() {
                currentCustomer.removeAwaitingPaymentOrder(
                    currentCustomer.getAwaitingPaymentOrders()[
                        index]); //TODO:remove order from server
              });
            }),
        TextButton(
          onPressed: () {
            setState(() {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderAwaitingPaymentDetailPage(
                          currentCustomer.getAwaitingPaymentOrders()[index])));
            });
          },
          child: Text('Details',
              style: TextStyle(
                fontSize: 15,
                color: theme.yellow,
              )),
        ),
      ],
    );
  }

  nameAndPrice(index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          currentCustomer.getAwaitingPaymentOrders()[index].getRestaurantName(),
          style: TextStyle(fontSize: 22, color: theme.black),
        ),
        Text(
          "${currentCustomer.getAwaitingPaymentOrders()[index].getPrice().toString()} T",
          style: TextStyle(fontSize: 13, color: theme.black),
        ),
      ],
    );
  }

  image(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/images/restaurant/" +
                Data.restaurants[index].getName() +
                ".jpg",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  showShoppingCart(index) {
    return Container(
      margin: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: theme.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.001,
              blurRadius: 15,
            )
          ]),
      child: Row(
        children: [
          image(index),
          nameAndPrice(index),
          Spacer(),
          detailAndDelete(index)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(currentCustomer.getAwaitingPaymentOrders().length,
          (index) => showShoppingCart(index)),
    );
  }
}
