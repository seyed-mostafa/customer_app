import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/Pages/Nav.dart';
import 'package:customer_app/Pages/TabBar.dart';
import 'package:customer_app/appBar.dart';
import 'package:flutter/material.dart';

class RestaurantPage extends StatefulWidget {

  Customer currentCustomer;
  Restaurant currentRestaurant;

  RestaurantPage(this.currentCustomer, this.currentRestaurant);

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            //height: MediaQuery.of(context).size.height/2,
            color: Colors.blue,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/3.jpg",
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 25,
                  left: MediaQuery.of(context).size.width * 0.10,
                  child: Text(
                    widget.currentRestaurant.getName(),
                    style: TextStyle(
                        color: theme.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),

          //back button
          Positioned(
              left: 0,
              top: 25,
              child: IconButton(
                onPressed: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Nav(widget.currentCustomer))
                  );
                },
                icon: Icon(Icons.arrow_back_sharp),
              )
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 5,
                  blurRadius: 40,
                )
              ]
            ),
            child: ListView(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height,
                    child: tabBar(widget.currentCustomer, widget.currentRestaurant)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
