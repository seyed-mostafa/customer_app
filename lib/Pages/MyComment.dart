import 'package:customer_app/Objects/Customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/theme.dart';


class CommentsPage extends StatefulWidget {
  Customer currentCustomer;

  CommentsPage(this.currentCustomer);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
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
                        'assets/images/${widget.currentCustomer.getComments()[index].getCustomerName()}.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            RichText(
              text: TextSpan(
                  text: widget.currentCustomer
                      .getComments()[index]
                      .getCustomerName(),
                  style: TextStyle(fontSize: 18, color: theme.black),
                  children: <TextSpan>[
                    TextSpan(text: widget
                          .currentCustomer
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
                    widget.currentCustomer.getComments()[index].getComment(),
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

  replyWrite(index) {
    bool isSend(String value) {
      print(send);
      print('str : $str');
      if (send && str != '' && str != 'Reply...') {
        setState(() {
          send = false;
          str = '';
          widget.currentCustomer.getComments()[index].setReply(value);
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
                  decoration: InputDecoration(hintText: 'Reply...'),
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
                        image: NetworkImage('assets/images/restaurant.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                RichText(
                  text: TextSpan(
                      text: widget.currentCustomer
                          .getComments()[index]
                          .getRestaurantName(),
                      style: TextStyle(fontSize: 18, color: theme.black),
                      children: <TextSpan>[
                        TextSpan(text: widget
                              .currentCustomer
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
                        widget.currentCustomer
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
            widget.currentCustomer.getComments()[index].getReply() == null
                ? replyWrite(index)
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

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView(
          children: List.generate(widget.currentCustomer.getComments().length,
                  (index) => showComment(index)),
        ));
  }
}
