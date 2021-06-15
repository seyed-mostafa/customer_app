import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Pages/OrderPageHistory.dart';
import 'package:customer_app/data/Data.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OrdersHistory extends StatefulWidget {


  @override
  _OrdersHistoryState createState() => _OrdersHistoryState();
}

class _OrdersHistoryState extends State<OrdersHistory> {

  Customer currentCustomer=Data.customer;

  detail(index) {
    return Row(
      children: [
        Spacer(),
        TextButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderPageHistory(
                          currentCustomer.getPreviousOrders()[index])));
            });
          },
          child: Text('View Details',
              style: TextStyle(
                fontSize: 15,
                color: theme.yellow,
              )),
        )
      ],
    );
  }

  price(index) {
    return Row(
      children: [
        Text(
          currentCustomer
              .getPreviousOrders()[index]
              .getPrice()
              .toString(),
          style: TextStyle(fontSize: 13, color: theme.black),
        ),
      ],
    );
  }

  nameAndItem(index) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          currentCustomer.getPreviousOrders()[index].getRestaurantName(),
          style: TextStyle(fontSize: 22, color: theme.black),
        ),
        Spacer(),
        RatingBar.builder(
          initialRating: 5,
          itemCount: 5,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return Icon(
                  Icons.sentiment_very_dissatisfied,
                  color: Colors.red,
                );
              case 1:
                return Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.redAccent,
                );
              case 2:
                return Icon(
                  Icons.sentiment_neutral,
                  color: Colors.amber,
                );
              case 3:
                return Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.lightGreen,
                );
              case 4:
                return Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.green,
                );
            }
          },
          itemSize: 25,
        )
      ],
    );
  }

  image() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage('assets/images/restaurant/2.jpg'),
              fit: BoxFit.fill),
        ),
      ),
    );
  }

  show(index) {
    print("show");
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 60, vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height / 7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
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
            image(),
            Container(
              width:  MediaQuery.of(context).size.width-200 ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 4,
                  ),
                  nameAndItem(index),
                  Spacer(),
                  price(index),
                  Spacer(),
                  detail(index),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  body() {
    return ListView(
      children: [
        SizedBox(height: 5),
        for (int i = 0; i < currentCustomer.getPreviousOrders().length; i++)
          if (currentCustomer.getPreviousOrders()[i].getDelivered())
            show(i)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: body(),
    );
  }
}
