import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Food.dart';
import 'package:intl/intl.dart';


class Order{
  String _customerName,_restaurentName;
  int _id;
  num _price=0;
  LatLng _customerAddress;
  static int _count=99246000;
  DateTime _time;
  Map <Food,int> _order=new Map();


  Order(Map <Food,int> order){
    this._order={...order};
    _count++;
    _id=_count;
    for(Food food in _order.keys){
     _price+= (food.getPrice()*(100-food.getDiscount()))/100*_order[food];
    }

  }
  void setCustomerName(String name){
    _customerName=name;
  }
  void setRestaurentName(String name){
    _restaurentName=name;
  }
  void setCustomerAddress(LatLng address){
    _customerAddress=address;
  }
  void setTime(){
    DateTime _time= DateTime.now();
  }


  num getPrice(){
    return _price;
  }

  LatLng getCustomerAddress(){
    return _customerAddress;
  }

  String getRestaurentName(){
    return _restaurentName;
  }

  String getTime() {
    return DateFormat('kk:mm:ss \n EEE d MMM').format(_time);
  }

  String getCustomerName(){
    return _customerName;
  }
  int getId(){
    return _id;
  }
  Map <Food,int> getOrder(){
    return _order;
  }


}