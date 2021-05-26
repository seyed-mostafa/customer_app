import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Order.dart';
import 'package:customer_app/Pages/AwaitingPayment.dart';
import 'package:customer_app/appBar.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/Objects/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class OrderPage extends StatefulWidget {
  Customer currentCustomer;
  Order currentOrder;

  OrderPage(this.currentCustomer, this.currentOrder);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  increaseOrDecrease(index) {
    return Row(
      children: [
        Spacer(
          flex: 5,
        ),
        IconButton(
            icon: Icon(
              FontAwesomeIcons.minus,
              size: 20,
              color: theme.black,
            ),
            onPressed: () {
              print('mines');
              setState(() {
                if (widget.currentOrder.getOrder().values.elementAt(index)-1==0) {
                  widget.currentCustomer.removeShoppingCart(widget.currentCustomer.getShoppingCart()[index]);
                }
                else{
                  widget.currentOrder.addFood(widget.currentOrder.getOrder().keys.elementAt(index),
                      widget.currentOrder.getOrder().values.elementAt(index)-1);
                }
              });
            }),
       // Spacer(),
        TextButton(
          onPressed: () {
            setState(() {

            });
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              widget.currentOrder.getOrder()[index].toString(),
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ),
          style: TextButton.styleFrom(
            primary: Colors.black,
            shadowColor: theme.black,
            backgroundColor: theme.yellow,
          ),
        ),
       // Spacer(),
        IconButton(
            icon: Icon(
              FontAwesomeIcons.plus,
              size: 20,
              color: theme.yellow,
            ),
            onPressed: () {
              print('add');
              setState(() {
                widget.currentOrder.addFood(widget.currentOrder.getOrder().keys.elementAt(index),
                    widget.currentOrder.getOrder().values.elementAt(index)+1);
              });

            }),
      ],
    );
  }

  price(index){
    return  Row(
      children: [
        Text(widget.currentCustomer.getShoppingCart()[index].getPrice().toString(),
          style: TextStyle(fontSize: 13,color: theme.black),),
      ],
    );
  }

  nameAndItem(index){
    return Row(
      children: [
        Text(widget.currentCustomer.getShoppingCart()[index].getRestaurantName(),
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
                widget.currentCustomer.removeShoppingCart(widget.currentCustomer.getShoppingCart()[index]);
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

  food(index) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 25,
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
              width: MediaQuery.of(context).size.width*3 / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 20,),
                  nameAndItem(index),
                  Spacer(flex: 1,),
                  price(index),
                  Spacer(flex: 15,),
                  increaseOrDecrease(index),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  body() {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => food(index),
              childCount: widget.currentOrder
                  .getOrder()
                  .length,
            )
        ),

      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    widget.currentOrder.setOrderTime();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) =>
                    AwaitingPayment(widget.currentCustomer))
            );
          },
        ),
        backgroundColor: Colors.white,
        title: Text('Foodina', style: TextStyle(color: theme.yellow,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic)),
        centerTitle: true,
        elevation: 10,
        iconTheme: IconThemeData(color: theme.yellow),
      ),
      body: body(),
    );
  }
}
