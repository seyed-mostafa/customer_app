
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/Pages/Nav.dart';
import 'package:customer_app/appBar.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class EditProfile extends StatefulWidget {

  Function change;
  Customer currentCustomer;

  EditProfile(this.change, this.currentCustomer);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final _formKey = GlobalKey<FormState>();

  String password = "123";
  String phoneNumber = "456";
  String inputPhoneNumber = '', inputPassword = '',
      _inputFirstName = '', _inputLastName = '', inputAddress = '';
  bool validUser = false;
  bool hidden = true;

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
        backgroundColor: theme.yellow,
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [

                  //firs name
                  TextFormField(
                    initialValue: widget.currentCustomer.getName(),
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
                    initialValue: widget.currentCustomer.getLastName(),
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
                    initialValue: widget.currentCustomer.getAddress().toString(),
                    cursorColor: theme.black,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.map),
                          onPressed: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => Map()));
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
                    onSaved: (String value) => inputAddress = value,
                  ),
                  SizedBox(height: 10,),

                  //Phone number
                  TextFormField(
                    initialValue: widget.currentCustomer.getPhoneNumber(),
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
                    onSaved: (String value) => inputPhoneNumber = value,
                  ),
                  SizedBox(height: 10,),

                  //Password
                  TextFormField(
                    initialValue: widget.currentCustomer.getPassword(),
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
                  ),
                  SizedBox(height: 20,),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: theme.yellow,
                        primary: theme.black,
                        padding: EdgeInsets.all(20)
                    ),
                    child: Text("Edit"),
                    onPressed: () async {
                      if(_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        print(_inputFirstName);
                        print(_inputLastName);
                        print(inputAddress);
                        print(inputPhoneNumber);
                        print(inputPassword);
                        widget.currentCustomer.setName(_inputFirstName);
                        widget.currentCustomer.setLastName(_inputLastName);
                        widget.currentCustomer.setPassword(inputPassword);
                        widget.currentCustomer.setPhoneNumber(inputPhoneNumber);
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => Nav(widget.currentCustomer)
                        ));
                      }
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}


