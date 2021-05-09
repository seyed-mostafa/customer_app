import 'Food.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Order{
  String _customerName;
  int _id;
  static int _count=99246000;
  DateTime _time;
  Map <Food,int> _order;


  Order(Map <Food,int> order){
    this._order={...order};
    _count++;
    _id=_count;

  }
  void setCustomerName(String name){
    _customerName=name;
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