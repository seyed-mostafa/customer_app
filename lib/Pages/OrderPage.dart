import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Food.dart';
import 'package:customer_app/Objects/Order.dart';
import 'package:customer_app/Pages/Nav.dart';
import 'package:customer_app/data/Data.dart';
import 'package:customer_app/data/SocketConnect.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'OrderPageOngoing.dart';

class OrderPage extends StatefulWidget {

  Order currentOrder;
  OrderPage(this.currentOrder);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Customer currentCustomer=Data.customer;


  void _sendMessage() async {
    await SocketConnect.socket.then((value) async {
      //format: addToOrders::restaurantName::orderTime::restaurantAddress::restaurantAddress::restaurantAddress::restaurantId::id::food^num&food^num

      String sendMessage="addToOrders::"+ widget.currentOrder.getRestaurantName()+"::"+widget.currentOrder.getOrderTime()+"::"+
          widget.currentOrder.getRestaurantAddress().getAddress()+"::"+widget.currentOrder.getRestaurantAddress().getLatitude().toString()+"::"+
          widget.currentOrder.getRestaurantAddress().getLongitude().toString()+"::"+widget.currentOrder.getRestaurantId().toString()+"::"+
          widget.currentOrder.getId().toString()+"::";
      for(Food food in widget.currentOrder.getOrder().keys)
         sendMessage+=food.getName()+"^"+widget.currentOrder.getOrder()[food].toString()+"&";
      sendMessage=sendMessage.substring(0,sendMessage.length-1);
      print(sendMessage);
      print(sendMessage);
      value.writeln(sendMessage);
    });
  }

  payment(){
    return  Container(
      margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*1/3),
      child: TextButton(
        onPressed: () {
          setState(() {
            if (currentCustomer.getWallet()<widget.currentOrder.getPrice()) {
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
              currentCustomer.setWallet(currentCustomer.getWallet()-
                  widget.currentOrder.getPrice());
              currentCustomer.removeShoppingCart(widget.currentOrder);
              currentCustomer.addPreviousOrders(widget.currentOrder);
              _sendMessage();
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Payment was successful'),
                  content: Text('Tracking Code : ${widget.currentOrder.getId()}\n'
                      '${widget.currentOrder.getOrderTime()}'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderPageOngoing(widget.currentOrder)));
                        });
                      },
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
        Spacer(),
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
        Container(
          padding: EdgeInsets.all(10),
          color: theme.yellow,
          child: Text(
            widget.currentOrder
                .getOrder()[
                    widget.currentOrder.getOrder().keys.elementAt(index)]
                .toString(),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ),
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
                    widget.currentOrder.getOrder().keys.elementAt(index));  //TODO:send data to server
              });
            })
      ],
    );
  }

  image(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/images/restaurant/" + widget.currentOrder.getRestaurantName() + ".jpg",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  food(index) {
    return Container(
      margin: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.20,
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
          Container(
            width: MediaQuery.of(context).size.width * 3 / 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nameAndItem(index),
                price(index),
                increaseOrDecrease(index),
              ],
            ),
          )
        ],
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
            borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
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
    return ListView(
      children: [
        restaurant(),
        for (int i = 0; i < widget.currentOrder.getOrder().length; i++) food(i),
        SizedBox(height: 5),
        table(),
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
