
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'FoodPage.dart';




class Home extends StatefulWidget {

  List<Restaurant> restaurants = [];
  int currentRestaurant;
  Home(this.restaurants, this.currentRestaurant);
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
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

  String _inputName='', _inputDescription='',
      _inputPrice='', _inputDiscount='0', _inputPath='';
  bool _inputSizing=false,_inputAvailable=false,_inputIsDiscount=false;
  List<String> foodType = [];
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    Widget showFood(index){
      return Container(
        padding: const EdgeInsets.all(2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FlatButton(
            color: Colors.amber,
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/3,
                  width: MediaQuery.of(context).size.width/3,
                  padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/'+(index+1).toString()+".jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text("   " + widget.restaurants[0].getMenu()[index].getName()),
                Spacer(),


              ],
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodPage(
                      widget.restaurants,
                      widget.currentRestaurant,
                      index
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    return Stack(
      children: [
        Container(
            child: ListView(
              children: List.generate(widget.restaurants[widget.currentRestaurant].getMenu().length, (index) => showFood(index)),
            )
        ),

      ],
    );
  }
}


