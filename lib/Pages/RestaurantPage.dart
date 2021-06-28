
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Food.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/Pages/FoodPage.dart';
import 'package:customer_app/data/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RestaurantPage extends StatefulWidget {


  int currentRestaurant;
  RestaurantPage(this.currentRestaurant);

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {

  Customer currentCustomer=Data.customer;
  Restaurant currentRestaurant;
  List<ChartData> chartData;
  String searchingText = "";
  TypeFood chosenType = TypeFood.all;

  List<ChartData> chartData7(){
    List<ChartData> chartData=[
      ChartData('Excellent', 45,'45%',Colors.green[800]),
      ChartData('Good', 30,'20%',Colors.green[500]),
      ChartData('Average',10, '10%',Colors.yellow[700]),
      ChartData('Poor',10, '10%',Colors.orange),
      ChartData('Worst',15, '15%',Colors.red),
    ];
    return chartData;
  }

  circlechart() {
    chartData = chartData7();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        child: SfCircularChart(
            legend: Legend(isVisible: true),
            title: ChartTitle(
              text:"Customer satisfaction",
              textStyle: TextStyle(color: theme.yellow,fontSize: 23,fontWeight: FontWeight.bold,),
            ),
            series: <PieSeries<ChartData, String>>[
              // Render pie chart
              PieSeries<ChartData, String>(
                  explode: true,
                  explodeIndex: 0,
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  dataLabelMapper: (ChartData data, _) => data.z,
                  pointColorMapper: (ChartData data, _) => data.color,
                  dataLabelSettings:DataLabelSettings(isVisible : true,)
              )
            ]
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    currentRestaurant=Data.restaurants.elementAt(widget.currentRestaurant);
    Size _size = MediaQuery.of(context).size;

    // Widget showFood(index){
    //   return Container(
    //     width: _size.width/2,
    //     padding: const EdgeInsets.all(2),
    //     margin: EdgeInsets.fromLTRB(10, 10, 5, 0),
    //     decoration: BoxDecoration(
    //       color: theme.yellow,
    //       borderRadius: BorderRadius.circular(10)
    //     ),
    //     child: TextButton(
    //       child: Column(
    //         children: [
    //           imageWidget(index),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               dataFoodWidget(index),
    //               //iconWidget(index)
    //             ],
    //           )
    //         ],
    //       ),
    //       onPressed: (){
    //         Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => FoodPage(currentRestaurant,currentRestaurant.getMenu().elementAt(index)),
    //           ),
    //         );
    //       },
    //     ),
    //   );
    // }

    Widget showFood(Food food, int index){
      return TextButton(
        onPressed: (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => FoodPage(currentRestaurant,food)));
        },
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap
        ),
        child: Container(
          margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: food.getDiscount() == 0 ? Container(
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
            ):Banner(
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

    Widget building(){
      return Container(
        height: _size.height,
        width: _size.width,
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            for(int i = 0; i < currentRestaurant.getMenu().length; i++)
              if(searchingText == "" || currentRestaurant.getMenu()[i].getName().contains(searchingText))
                if(chosenType == TypeFood.all || currentRestaurant.getMenu()[i].getTypeFood() == chosenType)
                  showFood(currentRestaurant.getMenu()[i], i)
          ],
        ),
      );
    }

    Widget searching(){
      return Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: TextField(
          cursorColor: theme.black,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(20),
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

    Widget typeWidget(TypeFood typeFood, Icon icon){
      return Container(
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        width: _size.width * 0.25 + typeFood.toString().length,
        child: TextButton(
          child: Container(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              children: [
                icon,
                typeFood != TypeFood.all ? Text("  " + typeFood.toString().substring(9),
                  style: TextStyle(
                      fontSize: _size.width * 0.03,
                      color: theme.yellow
                  )
                ):Text("  " + "AllFood",
                  style: TextStyle(
                      fontSize: _size.width * 0.03,
                      color: theme.yellow
                  ),
                )
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
        margin: EdgeInsets.only(bottom: 10),
        height: 50,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              //here null means all type
              typeWidget(TypeFood.all, Icon(Icons.assignment_turned_in_rounded, color: theme.yellow,)),
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

    return ListView(children:[
      searching(),
     chooseType(),
      building()
    ] );
  }
}

class ChartData {
  ChartData(this.x, this.y,this.z, [this.color]);
  final String x,z;
  final double y;
  final Color color;
}