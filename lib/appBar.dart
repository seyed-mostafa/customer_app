import 'dart:io';

import 'package:customer_app/data/Data.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';

import 'customerAndRestaurantMaker.dart';
import 'data/SocketConnect.dart';


AppBar appBar(){
  return  AppBar(
    actions: [
      IconButton(
          icon:Icon( Icons.refresh),
          onPressed: () async {
            String messageServer = "";
            var socket = Socket.connect('10.0.2.2', 8080) ;
            socket.then((serverSocket) async {
              serverSocket.writeln("Customer");
              serverSocket.writeln("Entering::" +
                  Data.customer.getPhoneNumber()+
                  "::" +
                  Data.customer.getPassword());
              serverSocket.listen((socket) {
                messageServer += String.fromCharCodes(socket).trim();
              });
            });
            await Future.delayed(Duration(seconds: 4)); //stop for listen threading
            print(messageServer);
            if (messageServer.contains("true")) {
              print(true);
              print(messageServer);
              messageServer = messageServer.substring(4); // remove true in start message
              Data.customer=null;
              Data.restaurants=[];
              customerAndRestaurantMaker(messageServer);
              SocketConnect.socket=socket;
            }
          })
    ],
    backgroundColor:Colors.white ,
    title: Text('Foodina',style: TextStyle(color: theme.yellow,
        fontSize: 30, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
    centerTitle: true,
    elevation: 10,
    iconTheme: IconThemeData(color:theme.yellow),
  );

}
