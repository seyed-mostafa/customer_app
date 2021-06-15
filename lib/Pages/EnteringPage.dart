
import 'dart:io';
import 'package:customer_app/Objects/Comment.dart';
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Order.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Pages/Nav.dart';
import 'package:customer_app/appBar.dart';
import 'package:customer_app/data/Customers.dart';
import 'package:customer_app/data/Data.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';
import 'RegisteringPage.dart';

class EnteringPage extends StatefulWidget {

  List<Customer> customers;
  EnteringPage(this.customers);

  @override
  _EnteringPageState createState() => _EnteringPageState();
}

class _EnteringPageState extends State<EnteringPage> {

  adding(Customer customer) {
    widget.customers.add(customer);
  }

  //fake Dates
  String password = "123";
  String phoneNumber = "456";

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
              SizedBox(height: 20,),
              validUser||flag ?
              Container(height: 40,):
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 40,
                child: Center(
                  child: Text(errorMessage,
                    style: TextStyle(color: Colors.white,),),
                ),
              ),
              SizedBox(height: 20,),
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
                    labelStyle: TextStyle(fontSize: 18,)
                ),
                onChanged: (String value){
                  inputPhoneNumberEnter = value;
                },
              ),
              SizedBox(height: 20,),
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
                    labelStyle: TextStyle(fontSize: 18)
                ),
                onChanged: (String value){
                  inputPasswordEnter = value;
                },
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 20,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: theme.yellow,
                        primary: theme.black,
                        padding: EdgeInsets.all(20)
                    ),
                    onPressed: (){
                      flag = false;
                      print(inputPhoneNumberEnter);
                      print(inputPasswordEnter);
                      _sendMessage();
                      if (validUser) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Nav(widget.customers[0])), // 0 index just for test
                        );
                      }
                      validUser = false;
                      setState(() {});
                    },
                    child: Text("Sign in", style: TextStyle(fontSize: 18),),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: theme.yellow,
                          primary: theme.black,
                          padding: EdgeInsets.all(20)
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisteringPage(adding)),
                        );
                      },
                      child: Text("Sign up", style: TextStyle(fontSize: 18),)
                  ),
                  SizedBox(width: 30,)
                ],
              ),
            ],
          ),
        ),
      )
    );
  }


  void _sendMessage() {
    Socket.connect("192.168.1.5", 8080)
        .then((serverSocket) {

      print('Connected to Server');

      serverSocket.writeln("Customer");

      serverSocket.writeln("Phone: " + inputPhoneNumberEnter + ", " + "pass: " + inputPasswordEnter);

      serverSocket.listen((socket) {
        String messageServer = String.fromCharCodes(socket).trim();

        print(messageServer);

        if (messageServer.contains("true")) {
          validUser = true;
          messageServer = messageServer.substring(4); // remove true in start message
          currentCustomerMaker(messageServer);
        }

        setState(() {

        });
      });
    });
  }

  void currentCustomerMaker (String messageServer) {
    String firstName = messageServer.substring(0, messageServer.indexOf("&"));
    messageServer = messageServer.substring(messageServer.indexOf("&") + 2);
    String lastName = messageServer.substring(0, messageServer.indexOf("&"));
    messageServer = messageServer.substring(messageServer.indexOf("&") + 2);
    String phoneNumber = messageServer.substring(0, messageServer.indexOf("&"));
    messageServer = messageServer.substring(messageServer.indexOf("&") + 2);
    String password = messageServer.substring(0, messageServer.indexOf("&"));
    messageServer = messageServer.substring(messageServer.indexOf("&") + 2);
    int wallet = int.parse(messageServer.substring(0, messageServer.indexOf("&")));
    print("firstName: " + firstName + ", lastName: " + lastName + ", phoneNumber: " + phoneNumber + ", password: " + password + ", wallet: " + wallet.toString());

    String list; //this is a String to this form:  [a, b, c, d, ]

    messageServer = messageServer.substring(messageServer.indexOf("&") + 2);
    list = messageServer.substring(1, messageServer.indexOf("&")); // 1 don't consider [

    List<Comment> comments = [];
    while (true) {
      if  (list.indexOf(",") == -1) break;
      String comment = list.substring(0, list.indexOf(","));
      comments.add(new Comment(comment));
      list = list.substring(list.indexOf(",") + 2);
    }

    for (int i = 0; i < comments.length; i++) {
      print(comments[i].getComment());
    }

    // List<Restaurant> favoriteRestaurant= [];
    // List<Order> shoppingCart = [];
    // List<Order> orders = [];
    Data.customer = new Customer(firstName, lastName, phoneNumber, password);
    Data.customer.setWallet(wallet);
  }
}