import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Restaurant.dart';

class Data {
  static final Data _data = Data._internal();
  static List<Restaurant> restaurants=List.empty(growable: true);
  static Customer customer;

  factory Data() {
    return _data;
  }

  Data._internal();

}
