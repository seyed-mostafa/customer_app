
import 'package:flutter/material.dart';
import 'package:seller_app/Objects/Food.dart';
import 'package:seller_app/Objects/Restaurant.dart';
import 'package:seller_app/Objects/theme.dart';
import 'package:seller_app/Pages/MenuPage.dart';
import 'package:seller_app/appBar.dart';
import 'app_bar.dart';
import 'package:customer_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Rigestering.dart';
import 'main_panel_customer_app.dart';
import 'theme.dart';


class AddFood extends StatefulWidget {

  List<Restaurant> restaurants = [];
  int currentRestaurant;

  AddFood(this.restaurants, this.currentRestaurant);

  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {

  String _inputName='', _inputDescription='',
      _inputPrice='', _inputDiscount='0', _inputPath='';
  bool _inputSizing=false,_inputAvailable=false,_inputIsDiscount=false;
  var _formKey = GlobalKey<FormState>();

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
      appBar: appBar(),
      body: Container(
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      children: [
                        TextFormField(//Food Name
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
                              icon: Icon(Icons.drive_file_rename_outline),
                              labelText: "Food Name",
                              labelStyle: TextStyle(fontSize: 18)
                          ),
                          onSaved: (String value) => _inputName = value,
                          validator: (String value){
                            if(value.isEmpty){
                              return "Name cannot be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10,),
                        TextFormField(//Food Description
                          maxLines: 2,
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
                              icon: Icon(Icons.drive_file_rename_outline),
                              labelText: "Description (optional)",
                              labelStyle: TextStyle(fontSize: 18)
                          ),
                          onSaved: (String value) => _inputDescription = value,
                        ),
                        SizedBox(height: 10,),
                        TextFormField(//Food Price
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
                              icon: Icon(Icons.monetization_on),
                              labelText: "Food Price",
                              labelStyle: TextStyle(fontSize: 18)
                          ),
                          onSaved: (String value) => _inputPrice = value,
                          validator: (String value){
                            if(value.isEmpty){
                              return "Price cannot be empty";
                            } else if(!isInteger(value)){
                              return "Price is number";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text("Do you have any discount?"),
                            IconButton(
                                icon: Icon(
                                  _inputIsDiscount?Icons.check_circle_rounded:Icons.circle,
                                  color: _inputIsDiscount?Colors.greenAccent:Colors.redAccent,
                                ),
                                onPressed: (){
                                  _inputIsDiscount = !_inputIsDiscount;
                                  setState(() {});
                                }
                            ),
                          ],
                        ),
                        _inputIsDiscount? TextFormField(///Food Discount
                          validator: (String value){
                            if(value.isEmpty){
                              return "Discount cannot be empty";
                            } else if(!isInteger(value) ||
                                int.parse(value)<0 ||
                                int.parse(value)>100){
                              return "Discount is integer between 0 to 100";
                            }
                            return null;
                          },
                          onSaved: (String value) => _inputDiscount = value,
                          decoration: InputDecoration(
                              icon: Icon(Icons.card_giftcard),
                              labelText: "Discount Percent",
                              labelStyle: TextStyle(fontSize: 18,)
                          ),
                        ):Container(),

                        SizedBox(height: 30,),

                        ElevatedButton(
                          onPressed: () {
                            if(_formKey.currentState.validate()){
                              _formKey.currentState.save();
                              print(_inputName);
                              print(_inputDescription);
                              print(_inputPrice);
                              print(_inputDiscount);
                              widget.restaurants[0].getMenu().add(Food(
                                  _inputName,
                                  _inputDescription,
                                  int.parse(_inputPrice),
                                  int.parse(_inputDiscount),
                                  true,
                                  true,
                                  TypeFood.Appetizer,
                                  _inputPath
                              ));
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FoodMenu(widget.restaurants, widget.currentRestaurant)));
                            }
                            setState(() {});
                          },
                          child: Text("Add Food"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
