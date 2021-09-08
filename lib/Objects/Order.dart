import 'package:intl/intl.dart';
import 'Food.dart';
import 'Location.dart';

class Order {
  static int _count = 99246000;
  String _restaurantName;
  String _customerName;
  String _orderTime;
  String _deliveryTime;
  Location _customerAddress;
  Location _restaurantAddress;
  int _restaurantId;
  int _id;
  int _price = 0;
  bool _delivered = false;
  double _rate = null;
  Map<Food, int> _foodsAndFoodsCount = new Map();

  Order(Food food, int foodCount, int restaurantId) {
    _foodsAndFoodsCount[food] = foodCount;
    _count++;
    _id = _count;
    _restaurantId = restaurantId;
  }

  Order.full(
    String restaurantName,
    String customerName,
    String orderTime,
    Location customerAddress,
    Location restaurantAddress,
    int restaurantId,
  ) {
    _restaurantName = restaurantName;
    _customerName = customerName;
    _orderTime = orderTime;
    _customerAddress = customerAddress;
    _restaurantAddress = restaurantAddress;
    _restaurantId = restaurantId;
  }

  void addFood(Food food, int foodCount) {
    _foodsAndFoodsCount[food] = foodCount;
  }

  void removeFood(Food food) {
    _foodsAndFoodsCount.remove(food);
    if (_foodsAndFoodsCount.isEmpty) {
      _restaurantId = 0;
    }
  }

  void setRestaurantName(String name) {
    _restaurantName = name;
  }

  void setOrderTime() {
    _count++;
    _id = _count;
    _orderTime = DateFormat('d MMM kk:mm').format(DateTime.now());
  }

  void setCustomerAddress(Location location) {
    _customerAddress = location;
  }

  void setRestaurantAddress(Location location) {
    _restaurantAddress = location;
  }

  void setStatus(bool b) {
    _delivered = b;
  }

  void setDelivered() {
    _delivered = true;
    _deliveryTime = DateFormat('d MMM kk:mm').format(DateTime.now());
  }

  void setRate(double rate) {
    _rate = rate;
  }

  String getRestaurantName() {
    return _restaurantName;
  }

  String getOrderTime() {
    return _orderTime;
  }

  String getDeliveryTime() {
    return _deliveryTime;
  }

  Location getCustomerAddress() {
    return _customerAddress;
  }

  Location getRestaurantAddress() {
    return _restaurantAddress;
  }

  int getRestaurantId() {
    return _restaurantId;
  }

  int getId() {
    return _id;
  }

  int getPrice() {
    _price = 0;
    for (Food food in _foodsAndFoodsCount.keys) {
      if (food.getDiscount() != null)
        _price += food.getPrice() *
            ((100 - food.getDiscount()) / 100) *
            _foodsAndFoodsCount[food].ceil();
      else
        _price += (food.getPrice() * _foodsAndFoodsCount[food]);
    }
    return _price;
  }

  bool getDelivered() {
    return _delivered;
  }

  double getRate() {
    return _rate;
  }

  Map<Food, int> getFoodsAndFoodsCount() {
    return _foodsAndFoodsCount;
  }
}
