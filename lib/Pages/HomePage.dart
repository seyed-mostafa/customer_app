
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Food.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/Pages/FoodPage.dart';
import 'package:customer_app/Pages/MenuType.dart';
import 'package:customer_app/Pages/RestaurantPage.dart';
import 'package:customer_app/Pages/TabBar.dart';
import 'package:customer_app/data/Restaurent.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {

  List<Restaurant> restaurants = importRestaurent();
  Customer currentCustomer;
  Home(this.currentCustomer);
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {

  String searchingText = "";
  TypeFood chosenType = null;

  @override
  Widget build(BuildContext context) {
    
    Size _size = MediaQuery.of(context).size;

    Widget searching(){
      return Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: TextField(
          cursorColor: theme.black,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10),
                ),
                borderSide: new BorderSide(
                  color: theme.black,
                  width: 1.0,
                ),
              ),
              fillColor: theme.yellow,
              filled: true,
              hintText: "search your restaurant",
              labelStyle: TextStyle(fontSize: 18,)
          ),
          onChanged: (String value){
            setState(() {
              searchingText = value;
              print(searching);
            });
          },
        ),
      );
    }

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

    Widget typeWidget(TypeFood typeFood, Icon icon){
      return Container(
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: theme.white,
          borderRadius: BorderRadius.circular(10)
        ),
        width: _size.width * 0.25 + typeFood.toString().length,
        child: TextButton(
          child: Container(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              children: [
                icon,
                Text("  " + typeFood.toString().substring(9),
                  style: TextStyle(fontSize: _size.width * 0.03),
                ),
              ],
            ),
          ),
          onPressed: (){
            setState(() {
              chosenType = typeFood;
            });
          },
        ),
      );
    }

    Widget chooseType(){
      return Container(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            typeWidget(TypeFood.Pizza, Icon(FontAwesomeIcons.pizzaSlice)),
            typeWidget(TypeFood.Sandwich, Icon(FontAwesomeIcons.hotdog,)),
            typeWidget(TypeFood.Drinks, Icon(FontAwesomeIcons.cocktail)),
            typeWidget(TypeFood.PersianFood, Icon(Icons.food_bank)),
            typeWidget(TypeFood.Dessert, Icon(Icons.no_food)),
            typeWidget(TypeFood.Appetizer, Icon(Icons.fastfood)),
            typeWidget(TypeFood.Fried, Icon(Icons.local_fire_department)),
            typeWidget(TypeFood.Steaks, Icon(Icons.set_meal)),
            typeWidget(TypeFood.Breakfast, Icon(Icons.breakfast_dining)),
            typeWidget(TypeFood.International, Icon(Icons.food_bank)),
          ]
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          searching(),
          chooseType(),
          for(int i = 0; i < widget.restaurants.length; i++)
            if(widget.restaurants[i].getMenu().isEmpty) Container()
            else if(chosenType != null && !widget.restaurants[i].getMenu().contains(chosenType)) Container()
            else if(searchingText == '') foodListForCustomer(widget.restaurants[i].getName(), widget.restaurants[i].getMenu())
            else if(widget.restaurants[i].getName().contains(searchingText))
              foodListForCustomer(widget.restaurants[i].getName(), widget.restaurants[i].getMenu())
            else Container()
        ],
      ),
    );
  }
}


