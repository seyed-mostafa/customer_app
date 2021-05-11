import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/appBar.dart';
import 'nav.dart';

class FoodPage extends StatefulWidget {
  List<Restaurant> restaurants = [];
  int currentRestaurant;
  int currentFood;

  FoodPage(this.restaurants, this.currentRestaurant, this.currentFood);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int state = 1;
  int like=0;


  @override
  Widget build(BuildContext context) {
    bag() {
      if (true) {
        return Row(
          children: [
            Spacer(
              flex: 3,
            ),
            IconButton(
                icon: Icon(
                  Icons.indeterminate_check_box_outlined,
                  size: 30,
                  color: theme.black,
                ),
                onPressed: () {
                  print('mines');
                }),
            Spacer(),
            TextButton(
              onPressed: () {
                print('add to bag');
              },
              child: Text('add to bag'),
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  shadowColor: theme.black,
                  backgroundColor: theme.yellow,
                  textStyle: TextStyle(fontSize: 45, color: Colors.green)),
            ),
            Spacer(),
            IconButton(
                icon: Icon(
                  Icons.add_box_outlined,
                  size: 30,
                  color: theme.yellow,
                ),
                onPressed: () {
                  print('add');
                }),
            Spacer(
              flex: 3,
            ),
          ],
        );
      } else {
        return Row(
          children: [
            Spacer(
              flex: 3,
            ),
            IconButton(
                icon: Icon(
                  Icons.indeterminate_check_box_outlined,
                  size: 30,
                  color: theme.black,
                ),
                onPressed: () {
                  print('mines');
                }),
            Spacer(),
            TextButton(
              onPressed: () {
                print('add to bag');
              },
              child: Text('1'),
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  shadowColor: theme.black,
                  backgroundColor: theme.yellow,
                  textStyle: TextStyle(fontSize: 45, color: Colors.green)),
            ),
            Spacer(),
            IconButton(
                icon: Icon(
                  Icons.add_box_outlined,
                  size: 30,
                  color: theme.yellow,
                ),
                onPressed: () {
                  print('add');
                }),
            Spacer(
              flex: 3,
            ),
          ],
        );
      }
    }


    DetailesOrReview() {
      if (state == 1) {
        return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 6,
                vertical: 15),
            child: Container(
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      spreadRadius: 10,
                      blurRadius: 0.5,
                      offset: Offset(0, 0))
                ]),
                child: Text(
                  widget.restaurants[widget.currentRestaurant]
                      .getMenu()[widget.currentFood]
                      .getDescription(),
                  style: TextStyle(color: theme.black, fontSize: 15),
                ),
              ),
            ));
      } else {
        return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 6,
                vertical: 15),
            child: Container(
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.white,
                      spreadRadius: 10,
                      blurRadius: 0.5,
                      offset: Offset(0, 0))
                ]),
                child: Text(widget.restaurants[widget.currentRestaurant]
                    .getMenu()[widget.currentFood]
                    .getComment()
                    .elementAt(0)),
              ),
            ));
      }
    }

    foodData() {


      return Container(
        child: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(

                  ),
                  child: IconButton(
                      icon: Icon(
                        like%2==0? Icons.favorite_border:Icons.favorite,
                        color: Colors.red,
                        size: 38,
                      ),
                      onPressed: () {
                        setState(() {
                          like++;
                        });
                      }
                  )
              ),
            ),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/1.jpg'), fit: BoxFit.cover),
            ),
          ),
          Container(

            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/100,vertical: 15),
            child: Column(
              children: [
                Row(children: [
                  Spacer(),
                  Text(
                    //name
                    widget.restaurants[widget.currentRestaurant]
                        .getMenu()[widget.currentFood]
                        .getName(),

                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 10,
                  ),
                  Text(
                    widget.restaurants[widget.currentRestaurant]
                        .getMenu()[widget.currentFood]
                        .getPrice()
                        .toString() +
                        ' T',
                    style: TextStyle(fontSize: 28),
                  ),
                  Spacer(),
                ]),
                SizedBox(
                  height: 5,
                ),

                Row(
                  children: [
                    Spacer(),
                    Text('by ',style: TextStyle(fontSize: 12,color: Colors.grey),),
                    Text(widget.restaurants[widget.currentRestaurant]
                        .getName(),

                      style: TextStyle(fontSize:12,fontWeight: FontWeight.bold),
                    ),
                    Spacer(flex: 10,),
                    Text(''),
                    Spacer(),
                  ],
                ),

              ],
            ),
          ),
            bag(),
            Padding(padding:EdgeInsets.all(20)),
            Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      state = 1;
                    });
                    print('Detailes ');
                    print(state);
                  },
                  child: Text('Detailes',
                      style: TextStyle(

                        fontSize: 25,
                        color: state == 1 ? theme.yellow : Colors.grey,)),
                ),
                Spacer(
                  flex: 2,
                ),
                TextButton(
                  onPressed: () {
                    print('Review ');
                    print(state);
                    setState(() {
                      state = 2;
                    });
                  },
                  child: Text('Review',
                      style: TextStyle(
                          fontSize: 25,
                          color: state == 2 ? theme.yellow : Colors.grey)),
                ),
                Spacer(),
              ],
            ),
            DetailesOrReview(),
            Spacer(),

          ],
        ),
      );
    }


    return Scaffold(
      appBar: appBar(),
      body: foodData(),
    );
  }
}
