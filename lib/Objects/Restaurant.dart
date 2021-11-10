import 'package:customer_app/Objects/Location.dart';
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

class Restaurant {
  static int _count = 99243000;
  String _name;
  String _phoneNumber;
  String _password;
  String _days;
  String _hour;
  String _addressString;
  num _sendingRangeRadius;
  num _id;
  Location _address;
  List<Food> _menu = List.empty(growable: true);
  List<TypeFood> _type = List.empty(growable: true);
  List<Comment> _comments = List.empty(growable: true);
  List<double> _rate = List.empty(growable: true);

  Restaurant(
    String name,
    Location address,
    String phoneNumber,
    String password,
  ) {
    _count++;
    _id = _count;
    this._name = name;
    this._phoneNumber = phoneNumber;
    this._password = password;
    this._address = address;
  }

  void addMenu(Food food) {
    _menu.add(food);
  }

  void addTypeFood(TypeFood typeFood) {
    _type.add(typeFood);
  }

  void addComment(Comment comment) {
    _comments.add(comment);
  }

  void addRate(double rate) {
    _rate.add(rate);
  }

  void addOrder() {}

  void setName(String name) {
    this._name = name;
  }

  void setPhoneNumber(String phoneNumber) {
    this._phoneNumber = phoneNumber;
  }

  void setPassword(String password) {
    this._password = password;
  }

  void setDays(String days) {
    this._days = days;
  }

  void setHour(String hour) {
    this._hour = hour;
  }

  void setAddressString(String addressString) {
    this._addressString = addressString;
  }

  void setSendingRangeRadius(num sendingRangeRadius) {
    this._sendingRangeRadius = sendingRangeRadius;
  }

  void setId(int id) {
    _id = id;
  }

  void setAddress(Location address) {
    this._address = address;
  }

  String getName() {
    return _name;
  }

  String getPhoneNumber() {
    return _phoneNumber;
  }

  String getPassword() {
    return _password;
  }

  String getAddressString() {
    return _addressString;
  }

  int getId() {
    return _id;
  }

  num getSendingRangeRadius() {
    return _sendingRangeRadius;
  }

  Location getAddress() {
    return _address;
  }

  List<Food> getMenu() {
    return _menu;
  }

  List<TypeFood> getTypeFoods() {
    return _type;
  }

  List<Comment> getComments() {
    return _comments;
  }

  double getRate() {
    double sum = 0;
    for (double i in _rate) sum += i;
    return sum / _rate.length;
  }
}
