import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';


AppBar appBar(){
  return  AppBar(
    backgroundColor:Colors.white ,
    title: Text('Foodina',style: TextStyle(color: theme.yellow,
        fontSize: 30, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
    centerTitle: true,
    elevation: 10,
    iconTheme: IconThemeData(color:theme.yellow),
  );

}
