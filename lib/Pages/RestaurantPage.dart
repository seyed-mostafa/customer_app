import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/Pages/FoodPage.dart';
import 'package:customer_app/Pages/MenuPage.dart';
import 'package:customer_app/Pages/Nav.dart';
import 'package:customer_app/Pages/TabBar.dart';
import 'package:customer_app/appBar.dart';
import 'package:customer_app/data/Restaurent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RestaurantPage extends StatefulWidget {

  Customer currentCustomer;
  Restaurant currentRestaurant;

  RestaurantPage(this.currentCustomer, this.currentRestaurant);

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {

  List<ChartData> chartData;
  String searchingText = "";

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

    Size _size = MediaQuery.of(context).size;

    imageWidget(index){
      return Stack(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height * 0.20,
            // width: MediaQuery.of(context).size.width * 0.40,
            padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/food1.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          widget.currentRestaurant.
          getMenu()[index].getDiscount() != null ?
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5)
              ),
              margin: EdgeInsets.fromLTRB(5, 10, 10, 10),

              child: Text("${widget.currentRestaurant.
              getMenu()[index].getDiscount()}%", style: TextStyle(color: Colors.white),),
            ),
          ):
          Container()
        ],

      );
    }

    dataFoodWidget(index){
      return Container(
        margin: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.currentRestaurant.getMenu()[index].getName()),
            Text("${widget.currentRestaurant.getMenu()[index].getPrice().toString()} T"),
          ],
        ),
      );
    }

    iconWidget(index){
      return IconButton(
        icon: Icon(FontAwesomeIcons.plusCircle),
        splashRadius: 5,
        onPressed: () => {
          widget.currentCustomer.addShoppingCart(
              widget.currentRestaurant.
              getMenu()[index],
              widget.currentRestaurant.getId(),
              1
          )
        },
      );
    }

    Widget showFood(index){
      return Container(
        width: _size.width/2,
        padding: const EdgeInsets.all(2),
        child: TextButton(
          child: Column(
            children: [
              imageWidget(index),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dataFoodWidget(index),
                  iconWidget(index)
                ],
              )
            ],
          ),
          onPressed: (){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(
                  index,
                  widget.currentCustomer,
                ),
              ),
            );
          },
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
            for(int i = 0; i < widget.currentRestaurant.getMenu().length; i++)
              if(searchingText == "" || widget.currentRestaurant.getMenu()[i].getName().contains(searchingText))
                showFood(i)
          ],
        ),
      );
    }

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

    return ListView(children:[
      searching(),
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