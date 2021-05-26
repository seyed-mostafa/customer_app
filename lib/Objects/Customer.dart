
import 'package:customer_app/Objects/Order.dart';
import 'Comment.dart';
import 'Restaurant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Food.dart';



class Customer{

  String _firstName,_lastName,_phoneNumber,_password;
  num _wallet=0;
  List<LatLng> _address = List.empty(growable: true);
  List<Comment> _comments = List.empty(growable: true);
  List<Restaurant> _favoriteRestaurant = List.empty(growable: true);
  List<Food> _favoriteFood = List.empty(growable: true);
  List<Order> _shoppingCart =List.empty(growable: true);
  List<Order> _orders = List.empty(growable: true);



  Customer(firstName,lastName,phoneNumber,password)
  {
    _firstName = firstName;
    _lastName=lastName;
    _phoneNumber=phoneNumber;
    _password=password;
  }

  void setName(String name) {
    _firstName = name;
  }
  void setLastName(String name) {
    _lastName = name;
  }
  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }
  void setPassword(String password) {
    _password = password;
  }
  void setWallet(num wallet) {
    _wallet = wallet;
  }
  void addAddress(LatLng address) {
    _address.add(address);
  }
  void removeShoppingCart(Order order){
    _shoppingCart.remove(order);
  }
  void addShoppingCart(Food food,int restaurantId,int i) {
    for(Order order in _shoppingCart){
      if (order.getRestaurantId()==restaurantId) {
        order.addFood(food, i);
        return;
      }
    }
    _shoppingCart.add(Order(food, restaurantId,i));
  }
  void removeFromShoppingCart(int index){
    addPreviousOrders(_shoppingCart[index]);
    _shoppingCart.removeAt(index);
  }
  void addPreviousOrders(Order order) {
    _orders.add(order);
  }
  void addComment(Comment comment) {
    _comments.add(comment);
  }
  void addFavoriteRestaurant(Restaurant favoriteRestaurant) {
    _favoriteRestaurant.add(favoriteRestaurant);
  }
  void addFavoriteFood(Food favoriteFood) {
    _favoriteFood.add(favoriteFood);
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
  List<LatLng> getAddress() {
    return _address;
  }
  List<Order> getShoppingCart() {
    return _shoppingCart;
  }
  List<Order> getPreviousOrders() {
    return _orders;
  }
  List<Comment> getComment() {
    return _comments;
  }
  List<Restaurant> getFavoriteRestaurant() {
    return _favoriteRestaurant;
  }
  List<Food> getFavoriteFood() {
    return _favoriteFood;
  }
}