import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Order.dart';
import 'package:customer_app/Pages/AwaitingPayment.dart';
import 'package:customer_app/Pages/Nav.dart';
import 'package:customer_app/Pages/ShoppingCartPage.dart';
import 'package:customer_app/appBar.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class OrderPage extends StatefulWidget {
  Customer currentCustomer;
  Order currentOrder;

  OrderPage(this.currentCustomer, this.currentOrder);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  payment(){
    return  Container(
      margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*1/3),
      child: TextButton(
        onPressed: () {
          setState(() {
            if (widget.currentCustomer.getWallet()<widget.currentOrder.getPrice()) {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('Inventory is insufficient'),
                content: const Text('Wallet balance is not enough.\nCharge your wallet'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Ok'),
                    child: const Text('Ok',style: TextStyle(color:Color(0xfffcb000)),),
                  ),
                ],
              ),
            );
            }
            else{
              widget.currentOrder.setOrderTime();
              widget.currentCustomer.setWallet(widget.currentCustomer.getWallet()-
                  widget.currentOrder.getPrice());
              widget.currentCustomer.removeShoppingCart(widget.currentOrder);
              widget.currentCustomer.addPreviousOrders(widget.currentOrder);
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Payment was successful'),
                  content: Text('Tracking Code : ${widget.currentOrder.getId()}\n'
                      '${DateFormat('d MMM EEEEEE kk:mm').
                  format(widget.currentOrder.getOrderTime())}'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Ok'),
                      child: const Text('Ok',style: TextStyle(color:Color(0xfffcb000)),),
                    ),
                  ],
                ),
              );
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text("Payment",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        style: TextButton.styleFrom(
          primary: Colors.black,
          shadowColor: theme.black,
          backgroundColor: theme.yellow,
        ),
      ),
    );
  }

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
                    )
                    .toList(),
              ),
              Container(
                  child: Text('Total : ${widget.currentOrder.getPrice()}'))
            ],
          ),
        ),
      ),
    );
  }

  increaseOrDecrease(index) {
    return Row(
      children: [
        Spacer(
          flex: 5,
        ),
        IconButton(
            icon: Icon(
              FontAwesomeIcons.minus,
              size: 20,
              color: theme.black,
            ),
            onPressed: () {
              print('mines');
              setState(() {
                if (widget.currentOrder.getOrder().values.elementAt(index) -
                        1 ==
                    0) {
                  widget.currentOrder.remove(
                      widget.currentOrder.getOrder().keys.elementAt(index));
                } else {
                  widget.currentOrder.addFood(
                      widget.currentOrder.getOrder().keys.elementAt(index),
                      widget.currentOrder.getOrder().values.elementAt(index) -
                          1);
                }
              });
            }),
        // Spacer(),
        TextButton(
          onPressed: () {
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Text(
              widget.currentOrder
                  .getOrder()[
                      widget.currentOrder.getOrder().keys.elementAt(index)]
                  .toString(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ),
          style: TextButton.styleFrom(
            primary: Colors.black,
            shadowColor: theme.black,
            backgroundColor: theme.yellow,
          ),
        ),
        // Spacer(),
        IconButton(
            icon: Icon(
              FontAwesomeIcons.plus,
              size: 20,
              color: theme.yellow,
            ),
            onPressed: () {
              print('add');
              setState(() {
                widget.currentOrder.addFood(
                    widget.currentOrder.getOrder().keys.elementAt(index),
                    widget.currentOrder.getOrder().values.elementAt(index) + 1);
              });
            }),
      ],
    );
  }

  price(index) {
    return Row(
      children: [
        Text(
          widget.currentOrder
              .getOrder()
              .keys
              .elementAt(index)
              .getPrice()
              .toString(),
          style: TextStyle(fontSize: 13, color: theme.black),
        ),
      ],
    );
  }

  nameAndItem(index) {
    return Row(
      children: [
        Text(
          widget.currentOrder.getOrder().keys.elementAt(index).getName(),
          style: TextStyle(fontSize: 22, color: theme.black),
        ),
        Spacer(),
        IconButton(
            icon: Icon(
              FontAwesomeIcons.trashAlt,
              size: 22,
              color: theme.red2,
            ),
            onPressed: () {
              setState(() {
                widget.currentOrder.remove(
                    widget.currentOrder.getOrder().keys.elementAt(index));
              });
            })
      ],
    );
  }

  image(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage('assets/images/food/${index + 1}.jpg'),
              fit: BoxFit.fill),
        ),
      ),
    );
  }

  food(index) {
    return Padding(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 25, 8,
          MediaQuery.of(context).size.width / 25, 0),
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
              width: MediaQuery.of(context).size.width * 3 / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 20,
                  ),
                  nameAndItem(index),
                  Spacer(
                    flex: 1,
                  ),
                  price(index),
                  Spacer(
                    flex: 15,
                  ),
                  increaseOrDecrease(index),
                ],
              ),
            )
          ],
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
                  image: NetworkImage('assets/images/restaurant/2.jpg'),
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
                      onPressed: (){},
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width /2,
                      child: Text(
                        widget.currentOrder.getRestaurantAddressString(),
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
        for (int i = 0; i < widget.currentOrder.getOrder().length; i++) food(i),
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
                        Nav(widget.currentCustomer)));
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
