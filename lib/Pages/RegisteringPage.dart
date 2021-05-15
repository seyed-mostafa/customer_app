
import 'package:customer_app/Objects/Customer.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'EnteringPage.dart';
import '../MultiChoice.dart';
import 'dart:io';

class RegisteringPage extends StatefulWidget {

  List<Customer> customers ;
  RegisteringPage(this.customers);

  @override
  _RegisteringPageState createState() => _RegisteringPageState();
}

class _RegisteringPageState extends State<RegisteringPage> {

  final _formKey = GlobalKey<FormState>();

  String password = "123";
  String phoneNumber = "456";
  String inputPhoneNumber = '', inputPassword = '',
      inputName = '', inputAddress = '';
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


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Registering Page")),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(50),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (String value){
                      if(value.isEmpty){
                        return "Name cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (String value) => inputName = value,
                    decoration: InputDecoration(
                        icon: Icon(Icons.drive_file_rename_outline),
                        labelText: "Restoran Name",
                        labelStyle: TextStyle(fontSize: 18,)
                    ),
                  ),
                  TextFormField(
                    validator: (String value){
                      if(value.isEmpty){
                        return "Address cannot be empty";
                      }
                      return null;
                    },
                    onSaved: (String value) => inputAddress = value,
                    decoration: InputDecoration(
                        icon: Icon(Icons.home),
                        labelText: "Address",
                        labelStyle: TextStyle(fontSize: 18,)
                    ),
                  ),
                  TextFormField(
                    autovalidate: true,
                    validator: (String value){
                      if(value.length != 8 ||
                          !isInteger(value) ||
                          value.contains(' ')){
                        return "Phone number should be 8 digit";
                      }
                      return null;
                    },
                    onSaved: (String value) => inputPhoneNumber = value,
                    decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        labelText: "Phone number",
                        labelStyle: TextStyle(fontSize: 18,)
                    ),
                  ),
                  TextFormField(
                    obscureText: hidden,
                    onChanged: (String value){
                      password = value;
                      setState(() {

                      });
                    },
                    validator: (String value){
                      if(value.length < 6 || value.contains('a')){
                        return "password at least contains 6 letter and number";
                      }
                      return null;
                    },
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
                      icon: Icon(Icons.vpn_key_sharp),
                      labelText: "Password",
                      labelStyle: TextStyle(fontSize: 18,),
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      child: Text("Click to choose your foodType"),
                      onPressed: () async {
                        foodType = await showDialog(
                            context: context,
                            builder: (_) => MultiSelectDialog(
                                question: Text('Select Your FoodType :'),
                                answers: [
                                  'traditional',
                                  'Chocolate',
                                  'Ice cream',
                                  'juice',
                                  'drinking'
                                ])
                            )??[];
                        print(foodType);
                      },
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () async {
                      if(_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        print(inputName);
                        print(inputAddress);
                        print(inputPhoneNumber);
                        print(inputPassword);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EnteringPage(widget.customers)),
                        );
                      }
                      setState(() {});
                    },
                    child: Text("Enter"),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}


