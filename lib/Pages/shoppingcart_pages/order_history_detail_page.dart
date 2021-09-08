import 'package:customer_app/Objects/Comment.dart';
import 'package:customer_app/Objects/Order.dart';
import 'package:customer_app/Pages/base_page.dart';
import 'package:customer_app/data/Data.dart';
import 'package:customer_app/data/SocketConnect.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'map_showonly_page.dart';

class OrderHistoryDetailPage extends StatefulWidget {
  final Order currentOrder;

  OrderHistoryDetailPage(this.currentOrder);

  @override
  _OrderHistoryDetailPageState createState() => _OrderHistoryDetailPageState();
}

class _OrderHistoryDetailPageState extends State<OrderHistoryDetailPage> {
  Comment comment;

  void _sendMessage() async {
    await SocketConnect.socket.then((value) async {
      // comment::comment(String)::restaurantName
      String sendMessage = "comment::" +
          Data.customer.getComments().last.getComment() +
          "::" +
          widget.currentOrder.getRestaurantName();
      value.writeln(sendMessage);
    });
  }

  void _sendMessageRate() async {
    await SocketConnect.socket.then((value) async {
      // Rate::restaurantId::rate
      String sendMessage = "Rate::" +
          widget.currentOrder.getRestaurantId().toString() +
          "::" +
          widget.currentOrder.getRate().toString();
      value.writeln(sendMessage);
    });
  }

  isComment() {
    for (Comment commentt in Data.customer.getComments()) {
      if (commentt.getRestaurantName() ==
          widget.currentOrder.getRestaurantName()) {
        comment = commentt;
        return true;
      }
    }
    return false;
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
                image: AssetImage("assets/images/restaurant/" +
                    widget.currentOrder.getRestaurantName() +
                    ".jpg"),
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
            padding: const EdgeInsets.fromLTRB(40, 20, 0, 0),
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
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => //TODO
                                    MapShowOnlyPage(widget.currentOrder)));
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        widget.currentOrder.getRestaurantAddress().getAddress(),
                        style: TextStyle(fontSize: 15),
                        softWrap: true,
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

  bool send = false;
  String str = '';

  replyWrite() {
    bool isSend(String value) {
      print(send);
      print('str : $str');
      if (send && str != '' && str != 'Comment...') {
        setState(() {
          send = false;
          str = '';
          Data.customer.addComment(new Comment.noFull(
              value,
              Data.customer.getName(),
              widget.currentOrder.getRestaurantName(),
              DateFormat('d MMM kk:mm').format(DateTime.now())));
          _sendMessage();
        });
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 9),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              child: TextFormField(
                  //Food Name
                  decoration: InputDecoration(hintText: 'Comment...'),
                  style: TextStyle(color: Colors.grey[600], fontSize: 10),
                  cursorColor: theme.black,
                  onChanged: (value) {
                    setState(() {
                      str = value;
                      print('value : $value');
                      isSend(value);
                    });
                  }),
            ),
            IconButton(
                icon: Icon(
                  Icons.send,
                  color: theme.yellow,
                ),
                onPressed: () {
                  setState(() {
                    send = true;
                    isSend(str);
                  });
                })
          ],
        ),
      ),
    );
  }

  comments(Comment comment) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 13,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/images/profile/${Data.customer.getName()}.jpg",
                fit: BoxFit.fill,
                height: 50,
                width: 50,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(comment.getCustomerName(),
                    style: TextStyle(fontSize: 18, color: theme.black)),
                Text(comment.getTimeComment(),
                    style: TextStyle(color: Colors.grey, fontSize: 10)),
              ],
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [theme.yellow2, theme.white], stops: [0, 0.8]),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    comment.getComment(),
                    style: TextStyle(color: theme.black, fontSize: 14),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [theme.yellow2, theme.white], stops: [0, 0.8]),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  body() {
    return ListView(
      children: [
        restaurant(),
        SizedBox(height: 5),
        Column(
          children: [
            table(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (widget.currentOrder.getRate() == null)
                  Container(
                    width: 50,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(hintText: 'Rate...'),
                      style: TextStyle(color: Colors.grey[600], fontSize: 10),
                      cursorColor: theme.black,
                      onChanged: (value) {
                        setState(() {
                          widget.currentOrder.setRate(double.parse(value));
                          _sendMessageRate();
                        });
                      },
                    ),
                  ),
                RatingBarIndicator(
                  rating: widget.currentOrder.getRate() != null
                      ? widget.currentOrder.getRate()
                      : 0,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 50,
                  ),
                  itemCount: 5,
                  itemSize: 35,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            isComment() ? comments(comment) : replyWrite(),
            SizedBox(
              height: 50,
            ),
          ],
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
                context, MaterialPageRoute(builder: (context) => BasePage(2)));
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
