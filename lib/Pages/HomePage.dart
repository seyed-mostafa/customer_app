

import 'package:customer_app/Objects/Food.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/Pages/FoodPage.dart';
import 'package:customer_app/Pages/RestaurantPage.dart';
import 'package:customer_app/Pages/RestaurantPageTabBar.dart';
import 'package:customer_app/data/Data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {



  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {

  List<Restaurant> restaurants = Data.restaurants;

  String searchingText = "";
  TypeFood chosenType = TypeFood.all;


  @override
  Widget build(BuildContext context) {
    
    Size _size = MediaQuery.of(context).size;

    Widget searching() {
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

    Widget showFood(Food food, int index){
      return TextButton(
        onPressed: (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => FoodPage(restaurants[index],food)));
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
                            blurRadius: 15,
                            offset: Offset(0,0)
                          )
                        ]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: AspectRatio(
                          aspectRatio: 16/10,
                          child: Container(
                            child: Image.asset("assets/images/food/" + food.getName() + ".jpg", fit: BoxFit.fill,)
                          ),
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
                                style: TextStyle(
                                  color: theme.black,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                food.getPrice().toString() + " T",
                                style: TextStyle(
                                  color: theme.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          splashRadius: 10,
                          icon: Icon(FontAwesomeIcons.plusCircle, color: theme.white,),
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

    Widget foodList(String title, List<Food> foods, int restaurantIndex){
      return Container(
        padding: EdgeInsets.only(bottom: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RestaurantPageTabBar(restaurantIndex)));

              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: theme.black
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: _size.height * 0.30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(foods.length, (index) => showFood(foods[index], restaurantIndex)),
              ),
            ),
          ],
        ),
      );
    }

    Widget showRestaurant(Restaurant restaurant, int id) {
      int index = 0;
      return TextButton(
        onPressed: (){
          for(int i = 0; i < restaurants.length; i++) {
            if(id == restaurants[i].getId()) {
              index = i;
            }
          }
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => RestaurantPageTabBar(index)));
        },
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap
        ),
        child: Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
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
                              blurRadius: 15,
                              offset: Offset(0,0)
                          )
                        ]
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: AspectRatio(
                        aspectRatio: 16/10,
                        child: Container(
                            child: Image.asset("assets/images/restaurant/" + restaurant.getName() + ".jpg", fit: BoxFit.fill,)
                        ),
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
                              restaurant.getName(),
                              style: TextStyle(
                                color: theme.black,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              restaurant.getAddress().toString(),
                              style: TextStyle(
                                color: theme.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget restaurantList(String title, List<Restaurant> chosenRestaurants) {
      return Container(
        margin: EdgeInsets.only(bottom: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                //ToDo
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: theme.black
                  ),
                ),
              ),
            ),
            Container(
              height: _size.height * 0.30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for(int i = 0; i < chosenRestaurants.length; i++)
                    showRestaurant(chosenRestaurants[i], chosenRestaurants[i].getId()),
                ]
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
                  style: TextStyle(fontSize: _size.width * 0.03,
                    color: theme.black
                  ),
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
            typeWidget(TypeFood.all, Icon(Icons.assignment_turned_in, color: theme.yellow,)),
            typeWidget(TypeFood.Pizza, Icon(FontAwesomeIcons.pizzaSlice, color: theme.yellow,)),
            typeWidget(TypeFood.Sandwich, Icon(FontAwesomeIcons.hotdog, color: theme.yellow,)),
            typeWidget(TypeFood.Drinks, Icon(FontAwesomeIcons.cocktail, color: theme.yellow,)),
            typeWidget(TypeFood.PersianFood, Icon(Icons.food_bank, color: theme.yellow,)),
            typeWidget(TypeFood.Dessert, Icon(Icons.no_food, color: theme.yellow,)),
            typeWidget(TypeFood.Appetizer, Icon(Icons.fastfood, color: theme.yellow,)),
            typeWidget(TypeFood.Fried, Icon(Icons.local_fire_department, color: theme.yellow,)),
            typeWidget(TypeFood.Steaks, Icon(Icons.set_meal, color: theme.yellow,)),
            typeWidget(TypeFood.Breakfast, Icon(Icons.breakfast_dining, color: theme.yellow,)),
            typeWidget(TypeFood.International, Icon(Icons.food_bank, color: theme.yellow,)),
          ]
        ),
      );
    }

    List<Restaurant> restaurantsByRate = new List.empty(growable: true);
    restaurantsByRate.addAll(restaurants);
    restaurantsByRate.sort((a, b) => a.getRate().compareTo(b.getRate()));
    restaurantsByRate = restaurantsByRate.reversed.toList();

    List<Restaurant> restaurantsByDistance = new List.empty(growable: true);
    restaurantsByDistance.addAll(restaurants);
    restaurantsByDistance.sort((a, b) =>
        a.getAddress().calculateDistance(
        a.getAddress().getLatitude(),
        a.getAddress().getLongitude(),
        Data.customer.getAddress()[0].getLatitude(),
        Data.customer.getAddress()[0].getLongitude()).compareTo(
            b.getAddress().calculateDistance(
                b.getAddress().getLatitude(),
                b.getAddress().getLongitude(),
                Data.customer.getAddress()[0].getLatitude(),
                Data.customer.getAddress()[0].getLongitude()
            )
        )
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          searching(),
          chooseType(),

          restaurantList("Popular Restaurants", restaurantsByRate),

          restaurantList("Near By Restaurant", restaurantsByDistance),

          restaurantList("All Restaurants", restaurants),

          for(int i = 0; i < restaurants.length; i++)
            if(restaurants[i].getMenu().isNotEmpty)
            if(chosenType == TypeFood.all || restaurants[i].getMenu().contains(chosenType))
            if(searchingText == '') foodList(restaurants[i].getName(), restaurants[i].getMenu(),i)
            else if(restaurants[i].getName().contains(searchingText))
              foodList(restaurants[i].getName(), restaurants[i].getMenu(), i) //i is index of restaurant in restaurants
        ],
      ),
    );
  }
}


