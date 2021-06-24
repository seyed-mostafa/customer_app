import 'dart:io';
import 'package:customer_app/Objects/Food.dart';
import 'package:customer_app/Objects/Location.dart';
import 'package:customer_app/Pages/Nav.dart';
import 'package:customer_app/appBar.dart';
import 'package:customer_app/Objects/Comment.dart';
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/data/Data.dart';

import 'package:customer_app/data/SocketConnect.dart';
import 'package:customer_app/test.dart';

import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';
import 'RegisteringPage.dart';

class EnteringPage extends StatefulWidget {
  @override
  _EnteringPageState createState() => _EnteringPageState();
}

class _EnteringPageState extends State<EnteringPage> {
  //fake Dates
  String password = "123";
  String phoneNumber = "456";

  Socket _Socket;

  //input Variable
  String inputPhoneNumberEnter = '', inputPasswordEnter = '';

  String errorMessage = "Phone number Or Password is wrong";
  bool validUser = false;

  //for first time don't show error of input (red container in top)
  bool flag = true;

  String messageServer = "";

  //for hide entering password
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: theme.yellow,
            padding: EdgeInsets.fromLTRB(50, 30, 50, 50),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                validUser || flag
                    ? Container(
                        height: 40,
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 40,
                        child: Center(
                          child: Text(
                            errorMessage,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  cursorColor: theme.black,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
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
                      icon: Icon(Icons.phone),
                      labelText: "phone number",
                      labelStyle: TextStyle(
                        fontSize: 18,
                      )),
                  onChanged: (String value) {
                    inputPhoneNumberEnter = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  cursorColor: theme.black,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
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
                      icon: Icon(Icons.vpn_key_sharp),
                      labelText: "password",
                      labelStyle: TextStyle(fontSize: 18)),
                  onChanged: (String value) {
                    inputPasswordEnter = value;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: theme.yellow,
                          primary: theme.black,
                          padding: EdgeInsets.all(20)),
                      onPressed: () {
                        flag = false;
                        print(inputPhoneNumberEnter);
                        print(inputPasswordEnter);
                        _sendMessage();
                        if (validUser) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Nav(),
                            )
                          );
                        }
                        validUser = false;
                        setState(() {});
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            onPrimary: theme.yellow,
                            primary: theme.black,
                            padding: EdgeInsets.all(20)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisteringPage()),
                          );
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(fontSize: 18),
                        )),
                    SizedBox(
                      width: 30,
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }


  void _sendMessage() async {
    await SocketConnect.socket.then((serverSocket) {
      print('Connected to Server in Entering Page');
      serverSocket.writeln("Customer");

      serverSocket.writeln("Phone: " +
          inputPhoneNumberEnter +
          ", " +
          "pass: " +
          inputPasswordEnter);

      serverSocket.listen((socket) async {
        String messageServer = await String.fromCharCodes(socket).trim();

        print(messageServer);

        if (messageServer.contains("true")) {
          validUser = true;
          messageServer =
              messageServer.substring(4); // remove true in start message
          currentCustomerMaker(messageServer);
        }
        setState(() {});
      });
    });
  }

  void currentCustomerMaker(String messageServer) {

    List<String> data = messageServer.split("&");

    for (String strig in data) print(strig);

    Data.customer = new Customer(data[0], data[1], data[2], data[3]);
    //firstName  0
    //lastName    1
    //phoneNumber  2
    //password     3
    Data.customer.setWallet(int.parse(data[4])); //wallet
    Data.customer.addAddress(
        new Location(data[5], double.parse(data[6]), double.parse(data[7])));

    ////////////////////         comment         ///////////////////

    List<String> comments = data[8].split("^^"); //comments

    for (int i = 0; i < comments.length; i++) {
      List<String> comment = comments[i].split("^");
      // comment          0
      //restaurantName    1
      //commentTime       2
      //reply             3
      //replyTime         4

      if (comment.length == 3) {
        Data.customer
            .addComment(new Comment.noFull(comment[0], comment[1], comment[2]));
      } else {
        Data.customer.addComment(new Comment.full(
            comment[0], comment[1], comment[2], comment[3], comment[4]));
      }
    }

    ////////////////////////             favoriteRestaurant          ///////////////

    List<String> favoriteRestaurants = data[9].split("^");
    for (int i = 0; i < favoriteRestaurants.length; i++) {
      Data.customer.addFavoriteRestaurant(int.parse(favoriteRestaurants[i]));
    }

    /////////////////////////               shoppingCart            ////////////////

    List<String> shoppingCarts = data[10].split("^^");
    for (String str in shoppingCarts) {
      List<String> shoppingCart = str.split("^");
      Data.customer.addNewShoppingCart(
          shoppingCart[0].substring(5),
          Data.customer.getName(),
          shoppingCart[2],
          Data.customer.getAddress()[0],
          new Location(shoppingCart[3], double.parse(shoppingCart[5]),
              double.parse(shoppingCart[4])),
          int.parse(shoppingCart[1]));
      List<String> foods = shoppingCart[6].split(":::");
      foods.removeLast();
      for (String food in foods) {
        List<String> f = food.split("::");
        Data.customer.addShoppingCart(
            new Food(
                f[0],
                f[1],
                int.parse(f[2]),
                int.parse(f[3]),
                null,
                f[4] == "true" ? true : false,
                TypeFood.values.firstWhere((e) => e.toString() == "TypeFood."+f[5])),
            int.parse(shoppingCart[1]),
            int.parse(f[6]));
      }
      if (str.startsWith("true")) {
        //check status of order
        Data.customer.getShoppingCart().last.setDelivered();
      }
    }
    /////////////////////////               Orders            ////////////////

    List<String> orders = data[11].split("^^");
    for (String str in orders) {
      List<String> order = str.split("^");
      Data.customer.addNewShoppingCart(
          order[0].substring(5),
          Data.customer.getName(),
          order[2],
          Data.customer.getAddress()[0],
          new Location(
              order[3], double.parse(order[5]), double.parse(order[4])),
          int.parse(order[1]));
      List<String> foods = order[6].split(":::");
      foods.removeLast();
      for (String food in foods) {
        List<String> f = food.split("::");
        Data.customer.addShoppingCart(
            new Food(
                f[0],
                f[1],
                int.parse(f[2]),
                int.parse(f[3]),
                null,
                f[4] == "true" ? true : false,
                TypeFood.values.firstWhere((e) =>  e.toString() == "TypeFood."+f[5])),
            int.parse(order[1]),
            int.parse(f[6]));
      }
      Data.customer.getShoppingCart().last.setDelivered();
    }

  }
}
