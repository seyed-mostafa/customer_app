import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Pages/shoppingcart_pages/order_history_detail_page.dart';
import 'package:customer_app/data/Data.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OrdersHistoryListPage extends StatefulWidget {
  @override
  _OrdersHistoryListPageState createState() => _OrdersHistoryListPageState();
}

class _OrdersHistoryListPageState extends State<OrdersHistoryListPage> {
  Customer currentCustomer = Data.customer;

  detail(index) {
    return Row(
      children: [
        Spacer(),
        TextButton(
          onPressed: () {
            setState(() {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderHistoryDetailPage(
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
          currentCustomer.getPreviousOrders()[index].getPrice().toString(),
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
        if (currentCustomer.getPreviousOrders()[index].getRate() != null)
          RatingBarIndicator(
            rating: currentCustomer.getPreviousOrders()[index].getRate(),
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 15,
          ),
      ],
    );
  }

  image(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          "assets/images/restaurant/${currentCustomer.getPreviousOrders()[index].getRestaurantName()}.jpg",
          fit: BoxFit.fill,
          height: 100,
          width: 100,
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
            image(index),
            Container(
              width: MediaQuery.of(context).size.width - 200,
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
          if (currentCustomer.getPreviousOrders()[i].getDelivered()) show(i)
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
