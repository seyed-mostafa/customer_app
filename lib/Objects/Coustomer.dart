import 'package:customer_app/Objects/Restaurant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Food.dart';
import 'Restaurant.dart';


class Customer{
String _firstName,_lastName,_phoneNumber,_password;
num _wallet=0;
Map <Food,int> _shoppingCart =new Map();
List<LatLng> _address = List.empty(growable: true);
List<Food> _previosOrders = List.empty(growable: true); /////   احتمالا باید تغییر کنه
List<String> _comment = List.empty(growable: true);    //        ///     باید علاوه بر نظر ، غذا هم ثبت بشه :|
List<Restaurant> _favoriteRestaurent = List.empty(growable: true);



Customer(firstName,lastName,phoneNumber,password)
{
   this._firstName = firstName;
   this._lastName=lastName;
   this._phoneNumber=phoneNumber;
   this._password=password;

}

void setName(String fname) {
  this._firstName = fname;
}

void setLastName(String lname) {
  this._lastName = lname;
}

void setPhoneNumber(String phoneNumber) {
  this._phoneNumber = phoneNumber;
}

void setPassword(String password) {
  this._password = password;
}
void setWallet(num wallet) {
  this._wallet = wallet;
}
void addAdres(LatLng address) {
  this._address.add(address);
}
void addPreviosOrders(Food food) {
  this._previosOrders.add(food);
}
void addComment(String comment) {
  this._comment.add(comment);
}
void addFavoriteRestaurent(Restaurant favoriteRestaurent) {
  this._favoriteRestaurent.add(favoriteRestaurent);
}
void addShoppingCart(Food food,int count) {
  _shoppingCart[food]=count;
}



String getName() {
  return _firstName ;
}

String getLastName() {
  return _lastName ;
}

String getPhoneNumber() {
  return _phoneNumber ;
}

String getPassword() {
  return _password ;
}
num getWallet() {
  return _wallet ;
}
List<LatLng> getAdres() {
  return _address;
}
List<Food> getPreviosOrders() {
  return _previosOrders;
}
List<String> getComment() {
  return _comment;
}
List<Restaurant> getFavoriteRestaurent() {
  return _favoriteRestaurent;
}
Map<Food,int> getShoppingCart() {
  return _shoppingCart;
}

void setShoppingCartClear() {               //سبد خرید با این تابع خلی میشه
   _shoppingCart.clear();                   //پس قبلش باید با تابع بالاییش، سبد خرید رو بگیریم و برای کلاس سفارشات بفرستیم
}



}