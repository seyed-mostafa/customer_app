

import 'package:customer_app/data/Data.dart';
import 'package:flutter/material.dart';


class Favorite extends StatefulWidget {

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {



  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;

    Widget restaurantElement(int index) {
      return Expanded(
        child: Container(
          color: Colors.red,
          height: (index+1)%2 == 0 ? _size.width * 0.66:_size.width * 0.33,
          width: (index+1)%2 == 0 ? _size.width * 0.66:_size.width * 0.33,
          child: Center(child: Text("Element")),
        ),
      );
    }

    return SingleChildScrollView(
      child: Wrap(
        // children: List.generate(Data.restaurants.length, (index) =>
        //   checkList.contains(restaurants[index].getId()) ?
        //   showRestaurant(restaurants[index], index) : Container(),
        //   ),
        children: [
          for(int i = 0; i < 10; i++)
            restaurantElement(i)
        ],
      )
    );
  }
}
