import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Order.dart';
import 'package:customer_app/Pages/Nav.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderPageHistory extends StatefulWidget {

  Order currentOrder;

  OrderPageHistory( this.currentOrder);

  @override
  _OrderPageHistoryState createState() => _OrderPageHistoryState();
}

class _OrderPageHistoryState extends State<OrderPageHistory> {

  table() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
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
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text('Food name'),
                  ),
                  DataColumn(numeric: true, label: Text('Num')),
                  DataColumn(numeric: true, label: Text('Price')),
                ],
                rows: widget.currentOrder
                    .getOrder()
                    .entries
                    .map(
                      (e) => DataRow(cells: [
                    DataCell(Text(e.key.getName())),
                    DataCell(Text(e.value.toString())),
                    DataCell(Text((e.key.getPrice() * e.value).toString())),
                  ]),
                ).toList(),
              ),
              Container(
                  child: Text('Total : ${widget.currentOrder.getPrice()}'))
            ],
          ),
        ),
      ),
    );
  }


  restaurant() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 1),
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('assets/images/restaurant/Mashti.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: theme.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40,20,40,0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'from  ',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      widget.currentOrder.getRestaurantName(),
                      style:
                      TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
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
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        FontAwesomeIcons.mapMarkerAlt,
                        size: 20,
                        color: theme.yellow,
                      ),
                      onPressed: (){},
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width /2,
                      child: Text(
                        widget.currentOrder.getRestaurantAddress().getAddress(),
                        style:
                        TextStyle(fontSize: 15),softWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  body() {
    print(widget.currentOrder.getOrder().length);
    return ListView(
      children: [
        restaurant(),
        SizedBox(height: 5),
        Column(
          children: [table()],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Nav()));
          },
        ),
        backgroundColor: Colors.white,
        title: Text('Foodina',
            style: TextStyle(
                color: theme.yellow,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic)),
        centerTitle: true,
        elevation: 10,
        iconTheme: IconThemeData(color: theme.yellow),
      ),
      body: body(),
    );
  }
}
