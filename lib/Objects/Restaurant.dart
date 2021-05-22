import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:customer_app/Objects/Comment.dart';
import 'Order.dart';
import 'Food.dart';


//  _name  =>                                                      نام رستوران
// _phoneNumber =>                                          شماره تماس رستوران
// _password =>                                کلمه عبور برای ورود به اپلیکیشن
// _days =>                               روز های کاری رستوران به صورت یک رشته
// _hour =>                                  ساعت کاری رستوران به ضورت یک رشته
// _sendingRangeRadius =>                   شعاع محدوده ارسال غذا توسط رستوران
// _address =>                       آدرس رستوران (به صورت مختصات )در کلاس خودش
// List<Food> _menu =>                    منو رستوران به صورت لیستی از جنس غذا

class Restaurant  {

  static int _count=99243000;
  String _name, _phoneNumber, _password, _days, _hour,_addressString;
  num _sendingRangeRadius,_id;
  LatLng _address;
  List<Food> _menu = List.empty(growable: true);
  List<TypeFood> _type;
  List<Order> _orders= List.empty(growable: true);
  List<Comment> _comments= List.empty(growable: true);
  List<Map> sales;

  Restaurant(String name, LatLng address, String phoneNumber, String password)  {
    _count++;
    _id=_count;
    this._name = name;
    this._address = address;
    this._password = password;
    this._phoneNumber = phoneNumber;
  }

  void setSales(Map sale){
    sales.add(sale);
  }

  int getOnlineSales(){
    int sum;
    for(int i=0;i<sales.length;i++){
      sum+=sales[i]["online"];
    }
    return sum;
  }

  int getCashSales(){
    int sum;
    for(int i=0;i<sales.length;i++){
      sum+=sales[i]["cash"];
    }
    return sum;
  }

  int getTotalSales(){
    int sum;
    for(int i=0;i<sales.length;i++){
      sum+=sales[i]["online"];
      sum+=sales[i]["cash"];
    }
    return sum;
  }

  void addComment(){
    for(int i=0;;i++){
      this.getMenu()[i];
    }
  }

  void addOrder(Order order){
    _orders.add(order);
    this.arrange();
  }

  void arrange(){
    List <Order> done= List.empty(growable: true);
    List <Order> undone= List.empty(growable: true);
    for(Order ord in _orders){
      if(ord.getStatus()==true){
        done.add(ord);
      }else{
        undone.add(ord);
      }
    }
    done.sort((a,b) => a.getOrderTime().compareTo(b.getOrderTime()) );
    undone.sort((a,b) => a.getOrderTime().compareTo(b.getOrderTime()) );
    _orders.clear();
    done=done.reversed.toList();
    undone=undone.reversed.toList();
    undone+=done;
    _orders+=undone;
  }

  List<Order> getOrders(){
    return _orders;
  }

  List<Food> getMenu() {
    return _menu;
  }

  void addMenu(Food food){
    _menu.add(food);
  }

  int getId(){
    return _id;
  }

  void addTypeFood(TypeFood typeFood){
    _type.add(typeFood);
  }

  List<TypeFood> getTypeFoods(){
    return _type;
  }
  void setAddressString(String addressString){
    this._addressString=addressString;
  }
  String getAddressString(){
    return _addressString;
  }


  void setName(String name) {
    this._name = name;
  }

  void setDays(String days) {
    this._days = days;
  }

  void setHour(String hour) {
    this._hour = hour;
  }

  void setAddress(LatLng address) {
    this._address = address;
  }

  void setPhoneNumber(String phoneNumber) {
    this._phoneNumber = phoneNumber;
  }

  void setPassword(String password) {
    this._password = password;
  }

  void setSendingRangeRadius(num sendingRangeRadius) {
    this._sendingRangeRadius = sendingRangeRadius;
  }





  String getName() {
    return _name;
  }

  LatLng getAddress() {
    return _address;
  }

  String getPhoneNumber() {
    return _phoneNumber;
  }

  String getPassword() {
    return _password;
  }

  num getSendingRangeRadius() {
    return _sendingRangeRadius;
  }

  String getDays() {
    return _days;
  }

  String getHour() {
    return _hour;
  }

}
