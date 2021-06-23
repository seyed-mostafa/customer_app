

import 'dart:io';

import 'package:customer_app/data/SocketConnect.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  void _sendMessage() {
      print('Connected to Server');

      SocketConnect.socket.then((value) {
        value.writeln("byeeee");
      });
  }

  @override
  Widget build(BuildContext context) {
    _sendMessage();
    print('Here3434');
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("this is test"),
        ),
      ),
    );
  }
}
