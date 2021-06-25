import 'package:customer_app/Objects/Location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:customer_app/Objects/Comment.dart';
import 'Food.dart';


//  _name  =>                                                      نام رستوران
// _phoneNumber =>                                          شماره تماس رستوران
// _password =>                                کلمه عبور برای ورود به اپلیکیشن
// _days =>                               روز های کاری رستوران به صورت یک رشته
// _hour =>                                  ساعت کاری رستوران به ضورت یک رشته
// _sendingRangeRadius =>                   شعاع محدوده ارسال غذا توسط رستوران
// _address =>                                   آدرس رستوران (به صورت مختصات )
// List<Food> _menu =>                    منو رستوران به صورت لیستی از جنس غذا

class Restaurant  {

  static int _count=99243000;
  String _name, _phoneNumber, _password, _days, _hour,_addressString;
  num _sendingRangeRadius,_id;
  Location _address;
  List<Food> _menu = List.empty(growable: true);
  List<TypeFood> _type;
  List<Comment> _comments= List.empty(growable: true);


  Restaurant(String name, Location address, String phoneNumber, String password)  {
    _count++;
    _id=_count;
    this._name = name;
    this._address = address;
    this._password = password;
    this._phoneNumber = phoneNumber;
  }


  List<Food> getMenu() {
    return _menu;
  }

  void setId(int id){
    _id=id;
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

  void addComment(Comment comment){
    _comments.add(comment);
  }
  List<Comment> getComments(){
    return _comments;
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

  void setAddress(Location address) {
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

  Location getAddress() {
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
