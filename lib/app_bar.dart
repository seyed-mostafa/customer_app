
import 'package:flutter/material.dart';

import 'Map.dart';
import 'theme.dart';





AppBar app_bar(BuildContext context){
    return  AppBar(
        backgroundColor:Colors.white ,
        title: Text('Foodina',style: TextStyle(color: theme.yellow,
            fontSize: 30, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
        centerTitle: true,
        elevation: 10,
        actions:<Widget> [
          IconButton(
            icon:Icon(Icons.map,color: Colors.black45),
          onPressed: (){Navigator.push(context, MaterialPageRoute(
           builder: (context) => Map()),);
          },
          ),


        ],
      );

  }

