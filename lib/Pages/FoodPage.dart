import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Food.dart';
import 'package:customer_app/Objects/Location.dart';
import 'package:customer_app/Objects/Order.dart';
import 'package:customer_app/Pages/RestaurantPageTabBar.dart';
import 'package:customer_app/data/Data.dart';
import 'package:customer_app/data/SocketConnect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FoodPage extends StatefulWidget {
  Customer customer=Data.customer;
  Food currentFood;
  Restaurant currentRestaurant;
  Order order;
  Food food;
  FoodPage(this.currentRestaurant,this.currentFood);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int state = 1;
  int like = 0;

  void _sendMessage() { //format: addToBag::foodIndex::count::restaurantId
    SocketConnect.socket.then((value) {
      value.writeln("addToBag::");
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isInBag() {
      if (widget.customer.getShoppingCart().isNotEmpty) {
        for (Order order in widget.customer.getShoppingCart()) {
          if (order.getRestaurantId() == widget.currentRestaurant.getId()) {
            for(Food food in order.getOrder().keys ){
              if (food.getName()==widget.currentFood.getName()) {
                widget.order=order;
                widget.food =food;
               break;
              }
            }
            return true;
          }
        }
      }
      return false;
    }

    addToBag() {
      return Row(
        children: [
          Spacer(
            flex: 3,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                widget.customer.addShoppingCart(
                    widget.currentFood,
                    widget.currentRestaurant.getId(),
                    1
                );
                _sendMessage();
                widget.order=widget.customer.getShoppingCart().last;
                widget.customer.getShoppingCart()[widget.customer.getShoppingCart().indexOf(widget.order)].setRestaurantName(widget.currentRestaurant.getName());
                widget.customer.getShoppingCart()[widget.customer.getShoppingCart().indexOf(widget.order)].setRestaurantAddress(new Location(" Tehran Province, Tehran, District 7, Mir Emad St &, Shahid Motahari St",35.717676891099835, 51.331243399093914));
                print('add to bag');

              });
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Add To Bag',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
            style: TextButton.styleFrom(
              primary: Colors.black,
              shadowColor: theme.black,
              backgroundColor: theme.yellow,
            ),
          ),
          Spacer(
            flex: 3,
          ),
        ],
      );
    }

    increaseOrDecrease() {
      return Row(
        children: [
          Spacer(
            flex: 5,
          ),
          IconButton(
              icon: Icon(
                FontAwesomeIcons.minus,
                size: 30,
                color: theme.black,
              ),
              onPressed: () {
                print('mines');
                setState(() {
                  if (widget.order.getOrder()[widget.food]-1==0) {
                    widget.order.remove(widget.food);
                    widget.order=null;
                  }
                  else{
                  widget.customer.addShoppingCart(
                      widget.currentFood,
                      widget.currentRestaurant.getId(), widget.order.getOrder()[widget.food]-1);
                  widget.order=widget.customer.getShoppingCart().last;
                  }
                });
              }),
          Spacer(),
          TextButton(
            onPressed: () {
              setState(() {

              });
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                widget.order.getOrder()[widget.food].toString(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
            style: TextButton.styleFrom(
              primary: Colors.black,
              shadowColor: theme.black,
              backgroundColor: theme.yellow,
            ),
          ),
          Spacer(),
          IconButton(
              icon: Icon(
                FontAwesomeIcons.plus,
                size: 30,
                color: theme.yellow,
              ),
              onPressed: () {
                print('add');
                setState(() {
                print(widget.order.getOrder()[widget.food]);
                widget.customer.addShoppingCart(
                    widget.currentFood,
                    widget.currentRestaurant.getId(), widget.order.getOrder()[widget.food]+1);
                widget.order=widget.customer.getShoppingCart().last;
                });

              }),
          Spacer(
            flex: 5,
          ),
        ],
      );
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
                  widget.currentFood
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
                child: Text(widget.currentFood
                    .getComment()
                    .elementAt(0)),
              ),
            ));
      }
    }

    foodData() {
      return Container(
        child: ListView(
          children: [
            Container(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(),
                    child: IconButton(
                        icon: Icon(
                          like % 2 == 0
                              ? Icons.favorite_border
                              : Icons.favorite,
                          color: Colors.red,
                          size: 38,
                        ),
                        onPressed: () {
                          setState(() {
                            like++;
                          });
                        })),
              ),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/food1.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 100,
                  vertical: 15),
              child: Column(
                children: [
                  Row(children: [
                    Spacer(),
                    Text(
                      //name
                      widget.currentFood
                          .getName(),

                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 10,
                    ),
                    Text(
                      widget.currentFood
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
                      Text(
                        'by ',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        widget.currentRestaurant.getName(),
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Spacer(
                        flex: 10,
                      ),
                      Text(''),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            isInBag() ? increaseOrDecrease() : addToBag(),
            Padding(padding: EdgeInsets.all(20)),
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
                        color: state == 1 ? theme.yellow : Colors.grey,
                      )),
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Foodina',
            style: TextStyle(
                color: theme.yellow,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic)),
        centerTitle: true,
        elevation: 10,
        iconTheme: IconThemeData(color: theme.yellow),
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => RestaurantPageTabBar(Data.restaurants.indexOf(widget.currentRestaurant))));
          },
        ),
      ),
      body: foodData(),
    );
  }
}
