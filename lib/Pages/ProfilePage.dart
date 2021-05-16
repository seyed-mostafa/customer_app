

import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/data/Restaurent.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import '../EditProfile.dart';

class Profile extends StatefulWidget {

  List<Restaurant> restaurants = importRestaurent();
  Customer currentCustomer;
  Profile(this.currentCustomer);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

    Widget informationWidget(){
      return Row(
        children: [
          Container(
              child: Icon(
                Icons.account_circle, size: 150,
              )
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("First Name : " + widget.currentCustomer.getName()),
              Text("Last Name : " + widget.currentCustomer.getLastName()),
              Text("Money of Wallet : " + widget.currentCustomer.getWallet().toString() + " T")
            ],
          )
        ],
      );
    }

    Widget choicesWidget(String title, Widget page){
      return TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          },
          child: Text(title, style: TextStyle(fontSize: 30),)
      );
    }

    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          informationWidget(),
          choicesWidget("Edit Information of Profile", EditProfile(widget.currentCustomer)),
          choicesWidget("Wallet Managing", null),
          choicesWidget("My Comments", null),
          choicesWidget("Interested Restaurants", null),
        ],
      ),
    );
    // return Stack(
    //   children: [
    //
    //     // Positioned(
    //     //     height: 50,
    //     //     width: MediaQuery.of(context).size.width,
    //     //     bottom: 0,
    //     //     child: Container(
    //     //       color: Colors.black,
    //     //       child: TextButton(
    //     //         child: Text("Edit Profile"),
    //     //         onPressed: (){
    //     //           Navigator.push(context, MaterialPageRoute(builder:
    //     //               (context) => EditProfile(widget.currentCustomer)));
    //     //         },
    //     //       ),
    //     //     )
    //     // ),
    //   ],
    // );
  }
}