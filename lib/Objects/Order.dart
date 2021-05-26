import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Food.dart';



class Order {

  String _restaurantName;
  int _restaurantId,_id,_price=0;
  bool _delivered=false;
  LatLng _restaurantAddress;
  static int _count=99246000;
  DateTime _orderTime,_deliveryTime;
  Map <Food,int> _order=new Map();


  Order(Food food,int restaurantId, int i) {
    _order[food]=i;
    _count++;
    _id=_count;
    _restaurantId=restaurantId;
  }


  void setDelivered(){
    _delivered=true;
    _deliveryTime= DateTime.now();
  }
  void setRestaurantName(String name){
    _restaurantName=name;
  }
  void setRestaurantAddress(LatLng address){
    _restaurantAddress=address;
  }
  void addFood(Food food,int i){
    _order[food]=i;
  }
  void setOrderTime(){
    _orderTime= DateTime.now();
  }
  void remove(Food food){
    _order.remove(food);
    if (_order.isEmpty) {
      _restaurantId=0;
    }
  }



  bool getDelivered(){
    return _delivered;
  }
  DateTime getOrderTime() {
    return _orderTime;
  }
  DateTime getDeliveryTime() {
    return _deliveryTime;
  }
  int getPrice(){
    for(Food food in _order.keys){
      if(food.getDiscount()!=null)
        _price+= ((food.getPrice()*(100-food.getDiscount()))/100*_order[food]).ceil();
      else
        _price+= (food.getPrice()*_order[food]);

    }
    return _price;
  }
  int getRestaurantId(){
    return _restaurantId;
  }
  String getRestaurantName(){
    return _restaurantName;
  }
  LatLng getRestaurantAddress(){
    return _restaurantAddress;
  }
  int getId(){
    return _id;
  }
  Map <Food,int> getOrder(){
    return _order;
  }
}