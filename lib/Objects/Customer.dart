import 'package:customer_app/Objects/Order.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/data/Data.dart';
import 'package:intl/intl.dart';
import 'Comment.dart';
import 'package:customer_app/Objects/Location.dart';
import 'Food.dart';

class Customer {
  String _firstName;
  String _lastName;
  String _phoneNumber;
  String _password;
  num _wallet = 0;
  List<Location> _addresses = List.empty(growable: true);
  List<Comment> _comments = List.empty(growable: true);
  List<int> _favoriteRestaurantsId = List.empty(growable: true);
  List<Order> _awaitingPaymentOrders = List.empty(growable: true);
  List<Order> _previousOrders = List.empty(growable: true);

  Customer(firstName, lastName, phoneNumber, password) {
    _firstName = firstName;
    _lastName = lastName;
    _phoneNumber = phoneNumber;
    _password = password;
  }

  void setFirstName(String firstName) {
    _firstName = firstName;
  }

  void setLastName(String lastName) {
    _lastName = lastName;
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
    _addresses.add(address);
  }

  void addComment(Comment comment) {
    _comments.add(comment);
  }

  void addFavoriteRestaurant(int favoriteRestaurant) {
    _favoriteRestaurantsId.add(favoriteRestaurant);
  }

  void addAwaitingPaymentOrder(Food food, int restaurantId, int foodCount) {
    for (Order order in _awaitingPaymentOrders) {
      if (order.getRestaurantId() == restaurantId) {
        order.addFood(food, foodCount);
        return;
      }
    }

    for (Restaurant restaurant in Data.restaurants)
      if (restaurant.getId() == restaurantId) {
        Order order = new Order.full(
          restaurant.getName(),
          _firstName,
          DateFormat('\n d MMM kk:mm').format(DateTime.now()),
          _addresses[0],
          restaurant.getAddress(),
          restaurantId,
        );

        order.addFood(food, foodCount);
        _awaitingPaymentOrders.add(order);
      }
  }

  void addNewAwaitingPaymentOrder(
    String restaurantName,
    String customerName,
    String orderTime,
    Location customerAddress,
    Location restaurantAddress,
    int restaurantId,
  ) {
    _awaitingPaymentOrders.add(
      new Order.full(
        restaurantName,
        customerName,
        orderTime,
        customerAddress,
        restaurantAddress,
        restaurantId,
      ),
    );
  }

  void addPreviousOrders(Order order) {
    _previousOrders.add(order);
  }

  void removeFavoriteRestaurantId(int id) {
    _favoriteRestaurantsId.remove(id);
  }

  void removeAwaitingPaymentOrderIndex(int index) {
    addPreviousOrders(_awaitingPaymentOrders[index]);
    _awaitingPaymentOrders.removeAt(index);
  }

  void removeAwaitingPaymentOrder(Order order) {
    _awaitingPaymentOrders.remove(order);
  }

  String getFirstName() {
    return _firstName;
  }

  String getLastName() {
    return _lastName;
  }

  String getPhoneNumber() {
    return _phoneNumber;
  }

  String getPassword() {
    return _password;
  }

  num getWallet() {
    return _wallet;
  }

  List<Location> getAddresses() {
    return _addresses;
  }

  List<Comment> getComments() {
    return _comments;
  }

  List<int> getFavoriteRestaurantsId() {
    return _favoriteRestaurantsId;
  }

  List<Order> getAwaitingPaymentOrders() {
    return _awaitingPaymentOrders;
  }

  List<Order> getPreviousOrders() {
    return _previousOrders;
  }
}
