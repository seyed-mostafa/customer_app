


import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:customer_app/Pages/Nav.dart';
import 'package:customer_app/Pages/RestaurantPage.dart';
import 'package:customer_app/Pages/RestaurantPage2.dart';
import 'package:customer_app/data/Data.dart';
import 'package:customer_app/data/SocketConnect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class RestaurantPageTabBar extends StatefulWidget {

  int restaurant;

  RestaurantPageTabBar(this.restaurant);

  @override
  _RestaurantPageTabBarState createState() => _RestaurantPageTabBarState();
}

class _RestaurantPageTabBarState extends State<RestaurantPageTabBar> {

  void _sendMessageAdd(id) async{
    //format: addFavorite::restaurantId
   await SocketConnect.socket.then((value) {
      value.writeln("addFavorite::"+id.toString());
    });
  }

  void _sendMessageRemove(id) async{
    //format: removeFavorite::restaurantId
   await SocketConnect.socket.then((value) {
      value.writeln("removeFavorite::"+id.toString());
    });
  }

  bool isInFavorite(){
    if (Data.customer.getFavoriteRestaurant().contains(Data.restaurants[widget.restaurant].getId()))
      return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
  Restaurant currentRestaurant=Data.restaurants[widget.restaurant];
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                actions: [
                  IconButton(
                      icon: Icon(
                        isInFavorite() ?  Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                        size: 38,
                      ),
                      onPressed: () {
                        setState(() {
                          if (Data.customer.getFavoriteRestaurant().contains(Data.restaurants[widget.restaurant].getId())){
                           _sendMessageRemove(Data.restaurants[widget.restaurant].getId());
                            Data.customer.removeFromFavoriteRestaurant(Data.restaurants[widget.restaurant].getId());
                          }
                          else{
                            _sendMessageAdd(Data.restaurants[widget.restaurant].getId());
                            Data.customer.addFavoriteRestaurant(Data.restaurants[widget.restaurant].getId());
                          }
                        });
                      })
                ],
                bottom: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(icon: Icon(Icons.fiber_manual_record),),
                    Tab(icon: Icon(Icons.food_bank),)
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(bottom: 50),
                  collapseMode: CollapseMode.parallax,
                  background: Image.asset("assets/images/restaurant/" + currentRestaurant.getName() + ".jpg"),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Spacer(),
                      Text(currentRestaurant.getName()),
                      Spacer(),
                      RatingBarIndicator(
                        rating: currentRestaurant.getRate(),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 15,
                      ),
                      SizedBox(width: 5,),
                      Text(currentRestaurant.getRate().toString(), style: TextStyle(color: theme.yellow,fontSize: 10),),
                      Text('/ 5.0', style: TextStyle(color: Colors.grey[500], fontSize: 10),)
                    ],
                  ),
                  centerTitle: true,
                ),
                expandedHeight: _size.height * 0.25,
                pinned: true,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Nav(0))
                      );
                    }
                ),
                floating: true,
              )
            ];
          },
          body: TabBarView(
            children: [
              RestaurantPage(widget.restaurant),
              RestaurantPage2(widget.restaurant)
            ],
          ),
        ),
      ),
    );
  }
}
