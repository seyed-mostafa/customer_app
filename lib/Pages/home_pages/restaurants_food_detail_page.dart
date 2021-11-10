import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Food.dart';
import 'package:customer_app/Objects/Order.dart';
import 'package:customer_app/Pages/home_pages/restaurant_base_page.dart';
import 'package:customer_app/data/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/constants/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RestaurantFoodDetailPage extends StatefulWidget {
  Order order;
  Customer customer = Data.customer;

  Food currentFood;
  Restaurant currentRestaurant;
  RestaurantFoodDetailPage(this.currentRestaurant, this.currentFood);

  @override
  _RestaurantFoodDetailPageState createState() =>
      _RestaurantFoodDetailPageState();
}

class _RestaurantFoodDetailPageState extends State<RestaurantFoodDetailPage> {
  int state = 1;
  int like = 0;

  bool isInBag() {
    if (widget.customer.getAwaitingPaymentOrders().isNotEmpty) {
      for (Order order in widget.customer.getAwaitingPaymentOrders()) {
        if (order.getRestaurantId() == widget.currentRestaurant.getId()) {
          for (Food food in order.getFoodsAndFoodsCount().keys) {
            if (food.getName() == widget.currentFood.getName()) {
              widget.order = order;
              print(order.getFoodsAndFoodsCount()[widget.currentFood]);
              return true;
            }
          }
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    addToBag() {
      return Row(
        children: [
          Spacer(
            flex: 3,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                widget.customer.addAwaitingPaymentOrder(
                    widget.currentFood, widget.currentRestaurant.getId(), 1);
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
                  if (widget.order.getFoodsAndFoodsCount()[widget.currentFood] -
                          1 ==
                      0) {
                    widget.order.removeFood(widget.currentFood);
                    widget.order = null;
                  } else {
                    widget.customer.addAwaitingPaymentOrder(
                        widget.currentFood,
                        widget.currentRestaurant.getId(),
                        widget.order
                                .getFoodsAndFoodsCount()[widget.currentFood] -
                            1);
                    widget.order =
                        widget.customer.getAwaitingPaymentOrders().last;
                  }
                });
              }),
          Spacer(),
          TextButton(
            onPressed: () {
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                widget.order
                    .getFoodsAndFoodsCount()[widget.currentFood]
                    .toString(),
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
                  widget.customer.addAwaitingPaymentOrder(
                      widget.currentFood,
                      widget.currentRestaurant.getId(),
                      widget.order.getFoodsAndFoodsCount()[widget.currentFood] +
                          1);
                  widget.order =
                      widget.customer.getAwaitingPaymentOrders().last;
                });
              }),
          Spacer(
            flex: 5,
          ),
        ],
      );
    }

    detailesOrReview() {
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
                  widget.currentFood.getDescription(),
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
                child: Text(widget.currentFood.getComments().elementAt(0)),
              ),
            ));
      }
    }

    foodData() {
      return Container(
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/food/' +
                        widget.currentFood.getName() +
                        '.jpg'),
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
                      widget.currentFood.getName(),

                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 10,
                    ),
                    Text(
                      widget.currentFood.getPrice().toString() + ' T',
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
            detailesOrReview(),
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
                    builder: (context) => RestaurantBasePage(
                        Data.restaurants.indexOf(widget.currentRestaurant))));
          },
        ),
      ),
      body: foodData(),
    );
  }
}
