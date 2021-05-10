import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/Pages/Nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Rigestering.dart';


class Entering extends StatefulWidget {

  List<Restaurant> restaurants = [];
  int currentRestaurant;

  Entering(this.restaurants, this.currentRestaurant);

  @override
  _EnteringState createState() => _EnteringState();
}

class _EnteringState extends State<Entering> {

  ///fake Dates
  String password = "123";
  String phoneNumber = "456";

  ///input Variable
  String inputPhoneNumberEnter = '', inputPasswordEnter = '';

  String errorMessage = "Phone number Or Password is wrong";
  bool validUser = false;
  bool flag = true;///for first time don't show error of input
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Entering page", style: TextStyle(color: theme.yellow),)),
          backgroundColor: theme.black,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: theme.yellow,
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
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
                TextFormField(
                  autofocus: true,
                  //style: TextStyle(color: Colors.white),
                  onChanged: (String value){
                    inputPhoneNumberEnter = value;
                  },
                  cursorColor: theme.black,
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
                ),
                SizedBox(height: 20,),
                TextField(
                  //style: TextStyle(color: Colors.white),
                  cursorColor: theme.black,
                  autofocus: true,
                  onChanged: (String value){
                    inputPasswordEnter = value;
                  },
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
                      labelText: "phone number",
                      labelStyle: TextStyle(fontSize: 18)
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 30,),
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
                        if(inputPhoneNumberEnter == phoneNumber && inputPasswordEnter == password){
                          validUser=true;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Nav(widget.restaurants, widget.currentRestaurant)),
                          );
                        }else{
                          validUser=false;
                        }
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
                            MaterialPageRoute(builder: (context) => Rigestring(widget.restaurants, widget.currentRestaurant)),
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
}