import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Pages/OrderPage.dart';
import 'package:customer_app/data/Data.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AwaitingPayment extends StatefulWidget {

  @override
  _AwaitingPaymentState createState() => _AwaitingPaymentState();
}

class _AwaitingPaymentState extends State<AwaitingPayment> {

Customer currentCustomer=Data.customer;

  detail(index){
    return Row(
        children: [
          Spacer(),
          TextButton(
              onPressed:(){
                setState(() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                      builder: (context) => OrderPage(currentCustomer.getShoppingCart()[index])));
                });
              },
              child: Text('View Details',
                  style: TextStyle(
                    fontSize: 15,
                    color:  theme.yellow ,
                  )),)
        ],
    );
  }

  price(index){
    print(currentCustomer.getShoppingCart()[index].getPrice());
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Text("${currentCustomer.getShoppingCart()[index].getPrice().toString()} T",
              style: TextStyle(fontSize: 13,color: theme.black),),
        ],
    );
  }

  nameAndItem(index){
    return Row(
      children: [
        Text(currentCustomer.getShoppingCart()[index].getRestaurantName(),
        style: TextStyle(fontSize: 22,color: theme.black),),
        Spacer(),
        IconButton(
            icon: Icon(
              FontAwesomeIcons.trashAlt,
              size: 22,
              color: theme.red2,
            ),
            onPressed: (){
              setState(() {
              currentCustomer.removeShoppingCart(currentCustomer.getShoppingCart()[index]);//TODO:remove order from server
              });
            })
      ],
    );
  }

  image(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage('assets/images/restaurant/2.jpg'),
              fit: BoxFit.fill),
        ),
      ),
    );
  }

  showShoppingCart(index){
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 60,
        vertical: 10
      ),
      child: Container(
        height: MediaQuery.of(context).size.height / 7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all( Radius.circular(15)),
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
            Container(
              width:  MediaQuery.of(context).size.width-200 ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 4,),
                  nameAndItem(index),
                  Spacer(),
                  price(index),
                  Spacer(),
                  detail(index),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20),
        child: ListView(
          children: List.generate(currentCustomer.getShoppingCart().length,
                  (index) => showShoppingCart(index)),
        ));
  }
}
