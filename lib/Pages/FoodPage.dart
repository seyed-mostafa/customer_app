

import 'package:flutter/material.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/appBar.dart';

class FoodPage extends StatefulWidget {

  List<Restaurant> restaurants = [];
  int currentRestaurant;
  int currentFood;

  FoodPage(this.restaurants, this.currentRestaurant, this.currentFood);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {



  @override
  Widget build(BuildContext context) {
    foodData(){
      return Container(
        color: Colors.amber,
        child: SizedBox(
          height: 400,
          child: Column(
            children: [
              Image.asset(
                "assets/images/1.jpg",
                fit: BoxFit.fitWidth,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff077b8a),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          )
                      ),
                      child: Column(
                        children: [
                          Text(//descriptions
                            widget.restaurants[widget.currentRestaurant].
                            getMenu()[widget.currentFood].getDescription(),
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text(
                              "Price : " +
                                  widget.restaurants[widget.currentRestaurant].
                                  getMenu()[widget.currentFood].getPrice().toString()
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      );
    }

    showComments(){
      return Container(

      );
    }

    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            foodData(),
            showComments()
          ],
        ),
      ),
    );
  }
}
