import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/data/Data.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';
import 'OrderPageOngoing.dart';


class OngoingOrders extends StatefulWidget {

  @override
  _OngoingOrdersState createState() => _OngoingOrdersState();
}

class _OngoingOrdersState extends State<OngoingOrders> {

  Customer currentCustomer = Data.customer;

  nameAndPrice(index){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(currentCustomer.getPreviousOrders()[index].getRestaurantName(),
          style: TextStyle(fontSize: 22,color: theme.black),),
        Text(currentCustomer.getPreviousOrders()[index].getPrice().toString(),
          style: TextStyle(fontSize: 13,color: theme.black),),
      ],
    );
  }

  image(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/images/restaurant/1.jpg",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  show(index){
    return Container(
      margin: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height / 7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all( Radius.circular(20)),
          color: theme.white,
          boxShadow:[
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.001,
              blurRadius: 15,
            )
          ]
      ),
      child: Row(
        children: [
          image(),
          nameAndPrice(index),
          Spacer(),
          TextButton(
            onPressed:(){
              setState(() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderPageOngoing(currentCustomer.getPreviousOrders()[index])));
              });
            },
            child: Text('Details',
                style: TextStyle(
                  fontSize: 15,
                  color:  theme.yellow ,
                )),)
        ],
      ),
    );
  }

  body() {
    return ListView(
      children: [
        for (int i = 0; i < currentCustomer.getPreviousOrders().length ; i++)
          if (!(currentCustomer.getPreviousOrders()[i].getDelivered()))
            show(i)
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: body(),
    );
  }
}
