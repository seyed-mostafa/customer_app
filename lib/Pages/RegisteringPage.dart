
import 'package:customer_app/Map.dart';
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/appBar.dart';
import 'package:customer_app/data/Data.dart';
import 'package:customer_app/data/SocketConnect.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'EnteringPage.dart';
import '../MultiChoice.dart';
import 'dart:io';

class RegisteringPage extends StatefulWidget {
  LatLng latLng;

  @override
  _RegisteringPageState createState() => _RegisteringPageState();
}

class _RegisteringPageState extends State<RegisteringPage> {


  change(LatLng latLng){
    setState(() {
      widget.latLng=latLng;
    });
  }


  final _formKey = GlobalKey<FormState>();

  String _inputPhoneNumber = '', _inputPassword = '',
      _inputFirstName = '', _inputLastName = '', _inputAddress = '',
      _inputLongitude = '', _inputLatitude = '';
  bool validUser = false;
  bool hidden = true;
  List<String> foodType = [];

  bool isInteger(String string) {
    // Null or empty string is not a number
    if (string == null || string.isEmpty) {
      return false;
    }

    // Try to parse input string to number.
    // Both integer and double work.
    // Use int.tryParse if you want to check integer only.
    // Use double.tryParse if you want to check double only.
    final number = int.tryParse(string);

    if (number == null) {
      return false;
    }

    return true;
  }

  void _sendMessage() async { //format: Registering::firstName::lastName::phoneNumber::password::address(String)::longitude::latitude
    print("Connected to Server in Registering");
    await SocketConnect.socket.then((value) {
      value.writeln("Customer");
      value.writeln("Registering::" + _inputFirstName + "::" + _inputLastName
        + "::" + _inputPhoneNumber + "::" + _inputPassword + "::"
        + _inputAddress + "::" + widget.latLng.longitude.toString() + "::" + widget.latLng.latitude.toString());
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: theme.yellow,
        appBar: appBar(context),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //firs name
                  TextFormField(
                    cursorColor: theme.black,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
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
                        icon: Icon(Icons.account_circle),
                        labelText: "First Name",
                        labelStyle: TextStyle(fontSize: 18,)
                    ),
                    validator: (String value){
                      if(value.isEmpty){
                        return "First Name cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (String value) => _inputFirstName = value,
                  ),
                  SizedBox(height: 10,),
                  //last name
                  TextFormField(
                    cursorColor: theme.black,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
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
                        icon: Icon(Icons.account_circle),
                        labelText: "Last Name",
                        labelStyle: TextStyle(fontSize: 18,)
                    ),
                    validator: (String value){
                      if(value.isEmpty){
                        return "Last Name cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (String value) => _inputLastName = value,
                  ),
                  SizedBox(height: 10,),
                  //Address
                  TextFormField(
                    cursorColor: theme.black,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.map),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Map(change)));
                          },
                        ),
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
                        icon: Icon(Icons.home_work),
                        labelText: "Address",
                        labelStyle: TextStyle(fontSize: 18,)
                    ),
                    validator: (String value){
                      if(value.isEmpty){
                        return "Address cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (String value) => _inputAddress = value,
                  ),
                  SizedBox(height: 10,),

                  //Phone number
                  TextFormField(
                    cursorColor: theme.black,
                    style: TextStyle(color: Colors.white),
                    autovalidate: true,
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
                        labelText: "Phone Number",
                        labelStyle: TextStyle(fontSize: 18,)
                    ),
                    validator: (String value){
                      if(value.length != 8 ||
                          !isInteger(value) ||
                          value.contains(' ')){
                        return "Phone number should be 8 digit";
                      }
                      return null;
                    },
                    onSaved: (String value) => _inputPhoneNumber = value,
                  ),
                  SizedBox(height: 10,),

                  //Password
                  TextFormField(
                    cursorColor: theme.black,
                    style: TextStyle(color: Colors.white),
                    obscureText: hidden,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                              !hidden?Icons.visibility:Icons.visibility_off
                          ),
                          onPressed: (){
                            hidden = !hidden;
                            setState(() {});
                          },
                        ),
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
                        icon: Icon(Icons.vpn_key),
                        labelText: "Password",
                        labelStyle: TextStyle(fontSize: 18,)
                    ),
                    onChanged: (String value){
                      _inputPassword = value;
                      setState(() {

                      });
                    },
                    validator: (String value){
                      if(value.length < 6 || !value.contains(RegExp(r'[a-zA-Z]')) || !value.contains(RegExp(r'[0-9]'))){
                        return "password at least contains 6 letter and number";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: theme.yellow,
                        primary: theme.black,
                        padding: EdgeInsets.all(20)
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        print(_inputFirstName);
                        print(_inputLastName);
                        print(_inputAddress);
                        print(_inputPhoneNumber);
                        print(_inputPassword);
                        _sendMessage();
                         Data.customer = new Customer(_inputFirstName,_inputLastName,_inputPhoneNumber,_inputPassword);
                        Navigator.pop(context,);
                      }
                      setState(() {});
                    },
                    child: Text("Register"),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}


