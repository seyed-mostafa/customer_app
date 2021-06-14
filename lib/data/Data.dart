import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Restaurant.dart';

class Data {
  static final Data _data = Data._internal();
  static List<Restaurant> restaurants=List.empty(growable: true);
  static List<Customer> customers=List.empty(growable: true);

  factory Data() {
    return _data;
  }

  Data._internal();

}
