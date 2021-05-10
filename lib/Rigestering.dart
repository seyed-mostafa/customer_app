
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:flutter/material.dart';

import 'entering_customer_app.dart';

class Rigestring extends StatefulWidget {

  List<Restaurant> restaurants = [];
  int currentRestaurant;

  Rigestring(this.restaurants, this.currentRestaurant);

  @override
  _RigestringState createState() => _RigestringState();
}


class _RigestringState extends State<Rigestring> {

  final _formKey = GlobalKey<FormState>();

  String inputPhoneNumber = '', inputPassword = '',
      inputName = '', inputLastName = '', inputAddress = '';
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
                        labelText: "Name",
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
                    onSaved: (String value) => inputLastName = value,
                    decoration: InputDecoration(
                        icon: Icon(Icons.drive_file_rename_outline),
                        labelText: "Last Name",
                        labelStyle: TextStyle(fontSize: 18,)
                    ),
                  ),
                  TextFormField(
                    autovalidate: true,
                    validator: (String value){
                      if(value.length != 11 || !isInteger(value)){
                        return "Phone number should be 11 digit";
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
                      inputPassword = value;
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
                  ElevatedButton(onPressed: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          padding: EdgeInsets.all(40),
                          height: double.infinity,
                          child: Column(
                            children: [
                              Text("Add your address"),
                              TextFormField(
                                onChanged: (String value){
                                  inputAddress = value;
                                  setState(() {

                                  });
                                },
                              ),
                            ],
                          )
                        )
                    );
                  },
                    child: Text("Add at least one Address"),),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                        _formKey.currentState.save();
                        print(inputName);
                        print(inputLastName);
                        print(inputPhoneNumber);
                        print(inputPassword);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Entering(widget.restaurants, widget.currentRestaurant)),
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


