
import 'package:customer_app/Objects/Order.dart';
import 'package:customer_app/Pages/Nav.dart';
import 'package:customer_app/test.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'mapShowOnly.dart';

class OrderPageOngoing extends StatefulWidget {

  Order currentOrder;

  OrderPageOngoing( this.currentOrder);

  @override
  _OrderPageOngoingState createState() => _OrderPageOngoingState();
}

class _OrderPageOngoingState extends State<OrderPageOngoing> {
  payment(){
    return  Container(
      alignment:Alignment.center ,
      child:  Text("Order is on the way....",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,fontStyle: FontStyle.italic,color: theme.red1),
      ),
    );
  }

  table() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
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
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            children: [
              DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text('Food name'),),
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
          padding: const EdgeInsets.only(bottom: 50),
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/restaurant/" + widget.currentOrder.getRestaurantName() + ".jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: theme.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40,20,0,0),
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
                      onPressed: (){
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) =>//TODO
                        MapShowOnly(
                            widget.currentOrder)
                        ));
                      },
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
        payment(),
        SizedBox(height: 20,)
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
                        Nav(2)));
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
