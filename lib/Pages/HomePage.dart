
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Food.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/Pages/FoodPage.dart';
import 'package:customer_app/Pages/RestaurantPage.dart';
import 'package:customer_app/Pages/TabBar.dart';
import 'package:customer_app/data/Restaurent.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/Restaurant.dart';

class Home extends StatefulWidget {

  List<Restaurant> restaurants = importRestaurent();
  Customer currentCustomer;
  Home(this.currentCustomer);
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    Widget showFood(Food food){
      return TextButton(
        onPressed: (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => FoodPage(0, widget.currentCustomer)));
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap
        ),
        child: Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: false ? Container():Banner(
              color: Colors.red,
              message: food.getDiscount().toString() + " %",
              location: BannerLocation.topStart,
              child: Container(
                width: _size.width * 0.5,
                color: theme.yellow.withOpacity(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            spreadRadius: 3,
                            blurRadius: 12,
                            offset: Offset(0,0)
                          )
                        ]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: _size.width * 0.5,
                          height: _size.height * 0.20,
                          child: Image.asset("assets/images/1.jpg", fit: BoxFit.fitWidth,)
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5, right: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                food.getName(),
                              ),
                              Text(
                                food.getPrice().toString() + " T"
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          splashRadius: 10,
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: (){

                          }
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget foodListForCustomer(String title, List<Food> foods){
      return Container(
        margin: EdgeInsets.only(bottom: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RestaurantPage(widget.currentCustomer, widget.restaurants[0]))
                );
              },
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: _size.height * 0.30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(foods.length, (index) => showFood(foods[index])),
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          for(int i = 0; i < widget.restaurants.length; i++)
            foodListForCustomer(widget.restaurants[i].getName(), widget.restaurants[i].getMenu())
        ],
      ),
    );
  }
}


