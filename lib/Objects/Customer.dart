
import 'package:customer_app/Objects/Order.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/data/Data.dart';
import 'package:intl/intl.dart';
import 'Comment.dart';
import 'package:customer_app/Objects/Location.dart';
import 'Food.dart';



class Customer{

  String _firstName,_lastName,_phoneNumber,_password;
  num _wallet=0;
  List<Location> _address = List.empty(growable: true);
  List<Comment> _comments = List.empty(growable: true);
  List<int> _favoriteRestaurant = List.empty(growable: true);
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
  void addAddress(Location address) {
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
    for(Restaurant restaurant in Data.restaurants)
      if (restaurant.getId()==restaurantId){
        Order order=new Order.full(restaurant.getName(), _firstName, DateFormat('\n d MMM kk:mm').format( DateTime.now()), _address[0], restaurant.getAddress(), restaurantId);
        order.addFood(food, i);
        _shoppingCart.add(order);
      }
  }

  void addNewShoppingCart(String restaurantName,String customerName,String orderTime,Location customerAddress,Location restaurantAddress,int restaurantId){
    _shoppingCart.add(new Order.full(restaurantName, customerName, orderTime, customerAddress, restaurantAddress, restaurantId));
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
  void addFavoriteRestaurant(int favoriteRestaurant) {
    _favoriteRestaurant.add(favoriteRestaurant);
  }
  void removeFromFavoriteRestaurant(int id) {
    _favoriteRestaurant.remove(id);
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
  List<Location> getAddress() {
    return _address;
  }
  List<Order> getShoppingCart() {
    return _shoppingCart;
  }
  List<Order> getPreviousOrders() {
    return _orders;
  }
  List<Comment> getComments() {
    return _comments;
  }
  List<int> getFavoriteRestaurant() {
    return _favoriteRestaurant;
  }

}