import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Food.dart';
import 'package:intl/intl.dart';
import 'Restaurant.dart';


class Order {
  String _customerName,_restaurentName,_customerAddressString;
  int _id,_price=0;
  bool _status=false;
  LatLng _customerAddress;
  static int _count=99246000;
  DateTime _orderTime,_deliveryTime;
  Map <Food,int> _order=new Map();


  Order(Map <Food,int> order) {
    this._order={...order};
    _count++;
    _id=_count;
    for(Food food in _order.keys){
      if(food.getDiscount()!=null)
        _price+= ((food.getPrice()*(100-food.getDiscount()))/100*_order[food]).ceil();
      else
        _price+= (food.getPrice()*_order[food]);
    }

  }
  void setCustomerAddressString(String customerAddressString){
    this._customerAddressString=customerAddressString;
  }
  String getCustomerAddressString(){
    return _customerAddressString;
  }
  void setStatus(){
    _status=!_status;
    if (_status) {
      setDeliveryTime();
    }
  }
  bool getStatus(){
    return _status;
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
  void setOrderTime(){
    _orderTime= DateTime.now();
  }
  void setDeliveryTime(){
    _deliveryTime= DateTime.now();
  }
  DateTime getDeliveryTime() {
    return _deliveryTime;
  }


  int getPrice(){
    return _price;
  }

  LatLng getCustomerAddress(){
    return _customerAddress;
  }

  String getRestaurentName(){
    return _restaurentName;
  }

  DateTime getOrderTime() {
    return _orderTime;
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