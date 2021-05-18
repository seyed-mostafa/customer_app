
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Food.dart';
import 'package:customer_app/Objects/theme.dart';
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
      return Container(
        margin: EdgeInsets.only(right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: false ? Container():Banner(
            color: Colors.red,
            message: food.getDiscount().toString() + " %",
            location: BannerLocation.topStart,
            child: Container(
              width: _size.width * 0.40,
              color: theme.yellow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    height: _size.height * 0.23,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/images/1.jpg", fit: BoxFit.fitHeight,),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
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
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget foodListForCustomer(String title, List<Food> foods){
      return Container(
        margin: EdgeInsets.only(bottom: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
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


