

import 'dart:io';

import 'package:customer_app/data/SocketConnect.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
=======
import 'package:google_maps_flutter/google_maps_flutter.dart';


void _sendMessage() async {
  await Socket.connect("192.168.56.1", 8080)
      .then((serverSocket) {
    print('Connected to Server');

    serverSocket.writeln("I am mostafa" );
    serverSocket.listen((socket) async {
      String messageServer =  String.fromCharCodes(socket).trim();
        print(messageServer);
    });
  });
}
>>>>>>> Stashed changes

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
