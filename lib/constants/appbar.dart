import 'dart:io';

import 'package:customer_app/data/Data.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/constants/theme.dart';
import '../customerAndRestaurantMaker.dart';
import '../data/SocketConnect.dart';

show(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: Builder(
        builder: (context) {
          // Get available height and width of the build area of this widget. Make a choice depending on the size.
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Container(
            height: height - 400,
            width: width - 400,
            child: CircularProgressIndicator(),
          );
        },
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    ),
  );
}

AppBar appBar(context) {
  return AppBar(
    actions: [
      IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () async {
            String messageServer = "";
            var socket = Socket.connect('10.0.2.2', 8080);
            socket.then((serverSocket) async {
              serverSocket.writeln("Customer");
              serverSocket.writeln("Entering::" +
                  Data.customer.getPhoneNumber() +
                  "::" +
                  Data.customer.getPassword());
              serverSocket.listen((socket) {
                messageServer += String.fromCharCodes(socket).trim();
              });
            });

            show(context);
            await Future.delayed(
                Duration(seconds: 4)); //stop for listen threading
            print(messageServer);
            if (messageServer.contains("true")) {
              print(true);
              print(messageServer);
              messageServer =
                  messageServer.substring(4); // remove true in start message
              Data.customer = null;
              Data.restaurants = [];
              customerAndRestaurantMaker(messageServer);
              SocketConnect.socket = socket;
            }
            Navigator.pop(
              context,
            );
          })
    ],
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
  );
}
