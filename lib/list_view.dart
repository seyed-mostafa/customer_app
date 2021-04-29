
import 'package:flutter/material.dart';


class list_view extends StatefulWidget {
  @override
  _list_viewState createState() => _list_viewState();
}

class _list_viewState extends State<list_view> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 260,
          child: Card(
            child: Center(child: Text('Item #$index')),
          ),
        );
      },
    );
  }
}