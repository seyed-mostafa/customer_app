

import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/appBar.dart';
import 'package:flutter/material.dart';

class MyComment extends StatefulWidget {

  Customer currentCustomer;

  MyComment(this.currentCustomer);

  @override
  _MyCommentState createState() => _MyCommentState();
}

class _MyCommentState extends State<MyComment> {

  Widget showComment(int index){
    return Container(

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: List.generate(widget.currentCustomer.getComment().length, (index) => showComment(index))
      )
    );
  }
}
