import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/appBar.dart';
import 'package:customer_app/data/Data.dart';
import 'package:customer_app/data/SocketConnect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:customer_app/Objects/theme.dart';


class CommentsPage extends StatefulWidget {


  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {

  Customer currentCustomer=Data.customer;

  comment(index) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        'assets/images/profile/Ali.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            RichText(
              text: TextSpan(
                  text: currentCustomer
                      .getComments()[index]
                      .getCustomerName(),
                  style: TextStyle(fontSize: 18, color: theme.black),
                  children: <TextSpan>[
                    TextSpan(text: currentCustomer
                          .getComments()[index]
                          .getTimeComment(),
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    )
                  ]),
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
                    gradient:
                    LinearGradient(
                        colors: [theme.yellow2, theme.white],
                        stops:[0,0.8]
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    currentCustomer.getComments()[index].getComment(),
                    style: TextStyle(color: theme.black, fontSize: 14),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    gradient:
                    LinearGradient( colors: [theme.yellow2, theme.white],
                        stops:[0,0.8]),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  bool send = false;
  String str = '';

  noReply(index) {
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
              child: Text("${currentCustomer.getComments()[index].getRestaurantName()} not yet reply...",
              style: TextStyle(color: Colors.grey[600], fontSize: 12),)
            ),
          ],
        ),
      ),
    );
  }

  replyShow(index) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 25,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Reply :",
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage('assets/images/restaurant/1.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                RichText(
                  text: TextSpan(
                      text: currentCustomer
                          .getComments()[index]
                          .getRestaurantName(),
                      style: TextStyle(fontSize: 18, color: theme.black),
                      children: <TextSpan>[
                        TextSpan(text: currentCustomer
                              .getComments()[index]
                              .getTimeReply(),
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        )
                      ]),
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
                        gradient:
                        LinearGradient( colors: [theme.yellow2, theme.white],
                            stops:[0,0.8]),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                       currentCustomer
                            .getComments()[index]
                            .getReply(),
                        style: TextStyle(color: theme.black, fontSize: 14),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        gradient:
                        LinearGradient( colors: [theme.yellow2, theme.white],
                            stops:[0,0.8]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showComment(index) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 16,
      ),
      child: Container(
        child: Column(
          children: [
            comment(index),
            currentCustomer.getComments()[index].getReply() == null
                ? noReply(index)
                : replyShow(index),
            Divider(
              color: theme.red2,
              thickness: 1,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() { //comment::comment(String)::restaurantName //ToDo
    SocketConnect.socket.then((value) {
      value.writeln("comment::");
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: appBar(),
       body: Container(
            padding: EdgeInsets.only(top: 20),
            child: ListView(
              children: List.generate(currentCustomer.getComments().length,
                      (index) => showComment(index)),
            )),
    );
  }
}
