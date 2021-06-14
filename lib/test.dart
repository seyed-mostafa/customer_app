
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/data/Data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
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

void main() {

  Data.restaurants.add(new Restaurant('akbar jooje',
      LatLng(35.717676891099835, 51.331243399093914), '09123456780', '1234'));
  print(Data.restaurants.first.getId());
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
