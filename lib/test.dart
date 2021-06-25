


import 'package:customer_app/Objects/Comment.dart';
import 'package:customer_app/Objects/Customer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Objects/Food.dart';
import 'Objects/Location.dart';
import 'Objects/Restaurant.dart';
import 'data/Data.dart';

class Test extends StatefulWidget {
  String str;
Test(this.str);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  @override
  Widget build(BuildContext context) {
    currentCustomerMaker(widget.str);
    return Scaffold(
      body: Center(
        child: Text(widget.str),
      ),
    );
  }
}

Future sleep1() {
  return new Future.delayed(const Duration(seconds: 1), () => "1");
}
 currentCustomerMaker(String messageServer){
//   print(messageServer);

    List<String> data = messageServer.split("&");

  for (String strig in data)
    print(strig);
  // print("here");
 // Data.customer = new Customer(data[0], data[1], data[2], data[3]);
  //firstName  0
  //lastName    1
  //phoneNumber  2
  //password     3
  // Data.customer.setWallet(int.parse(data[4])); //wallet
  // Data.customer.addAddress(
  //     new Location(data[5], double.parse(data[6]), double.parse(data[7])));
  // // print("and here");
  //
  // ////////////////////         comment         ///////////////////
  //
  // List<String> comments = data[8].split("^^"); //comments
  //
  // for (int i = 0; i < comments.length; i++) {
  //   List<String> comment = comments[i].split("^");
  //   // comment          0
  //   //restaurantName    1
  //   //commentTime       2
  //   //reply             3
  //   //replyTime         4
  //
  //   if (comment.length == 3) {
  //     Data.customer
  //         .addComment(new Comment.noFull(comment[0], comment[1], comment[2]));
  //   } else {
  //     Data.customer.addComment(new Comment.full(
  //         comment[0], comment[1], comment[2], comment[3], comment[4]));
  //   }
  // }
  //
  // ////////////////////////             favoriteRestaurant          ///////////////
  //
  // List<String> favoriteRestaurants = data[9].split("^");
  // for (int i = 0; i < favoriteRestaurants.length; i++) {
  //   Data.customer.addFavoriteRestaurant(int.parse(favoriteRestaurants[i]));
  // }
  //
  // /////////////////////////               shoppingCart            ////////////////
  //
  // List<String> shoppingCarts = data[10].split("^^");
  // for (String str in shoppingCarts) {
  //   List<String> shoppingCart = str.split("^");
  //   Data.customer.addNewShoppingCart(
  //       shoppingCart[0].substring(5),
  //       Data.customer.getName(),
  //       shoppingCart[2],
  //       Data.customer.getAddress()[0],
  //       new Location(shoppingCart[3], double.parse(shoppingCart[5]),
  //           double.parse(shoppingCart[4])),
  //       int.parse(shoppingCart[1]));
  //   List<String> foods = shoppingCart[6].split(":::");
  //   foods.removeLast();
  //   for (String food in foods) {
  //     List<String> f = food.split("::");
  //     Data.customer.addShoppingCart(
  //         new Food(
  //             f[0],
  //             f[1],
  //             int.parse(f[2]),
  //             int.parse(f[3]),
  //             null,
  //             f[4] == "true" ? true : false,
  //             TypeFood.values.firstWhere((e) =>
  //             e.toString() == "TypeFood." + f[5])),
  //         int.parse(shoppingCart[1]),
  //         int.parse(f[6]));
  //   }
  //   if (str.startsWith("true")) {
  //     //check status of order
  //     Data.customer
  //         .getShoppingCart()
  //         .last
  //         .setDelivered();
  //   }
  // }
  // /////////////////////////               Orders            ////////////////
  //
  // // List<String> orders = data[11].split("^^");
  // // for (String str in orders) {
  // //   List<String> order = str.split("^");
  // //   Data.customer.addNewShoppingCart(
  // //       order[0].substring(5),
  // //       Data.customer.getName(),
  // //       order[2],
  // //       Data.customer.getAddress()[0],
  // //       new Location(
  // //           order[3], double.parse(order[5]), double.parse(order[4])),
  // //       int.parse(order[1]));
  // //   List<String> foods = order[6].split(":::");
  // //   foods.removeLast();
  // //   for (String food in foods) {
  // //     List<String> f = food.split("::");
  // //     Data.customer.addShoppingCart(
  // //         new Food(
  // //             f[0],
  // //             f[1],
  // //             int.parse(f[2]),
  // //             int.parse(f[3]),
  // //             null,
  // //             f[4] == "true" ? true : false,
  // //             TypeFood.values.firstWhere((e) =>  e.toString() == "TypeFood."+f[5])),
  // //         int.parse(order[1]),
  // //         int.parse(f[6]));
  // //   }1
  // //   Data.customer.getShoppingCart().last.setDelivered();
  // // }
  //
  //
  // ////////////////////////////////////////////////////////              restaurants data        from data : 12             /////////////////////////////////
  // print(data[11]);
  // List<String> data1 = data[11].split("#");
  //
  // Restaurant restaurant = new Restaurant(
  //     data[0],
  //     new Location(data1[1], double.parse(data1[3]), double.parse(data1[2])),
  //     data1[4], data1[5]);
  // restaurant.setSendingRangeRadius(int.parse(data1[6]));
  // restaurant.setId(int.parse(data1[7]));
  // restaurant.setDays(data1[8]);
  // restaurant.setHour(data1[9]);
  //
  // List<String> type = data1[10].split("::");
  // for (String string in type) {
  //   restaurant.addTypeFood(TypeFood.values.firstWhere((e) => e.toString() ==
  //       "TypeFood." + string));
  // }
}



