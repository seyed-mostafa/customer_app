
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';


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

void main() {

  _sendMessage();


  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(),
      ),
    );
  }
}
