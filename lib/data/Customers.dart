
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Order.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/data/Restaurent.dart';
import 'package:customer_app/data/Restaurent.dart';

List<Customer> importCustomers(){
 Customer customer1 = new Customer('Ali', 'Alavi', '09123456790', '123');
 Customer customer2 = new Customer('Naghi', 'Naghavi', '09123456791', '123');
 Customer customer3 = new Customer('Soltan', 'Soltani', '09123456792', '123');
 Customer customer4 = new Customer('Abbas', 'Abbasi', '09123456793', '123');
 Customer customer5 = new Customer('Mostafa', 'Mostafai', '09123456794', '123');
 Customer customer6 = new Customer('Gol', 'Kharzare', '09123456795', '123');
 Customer customer7 = new Customer('Noora', 'Noori', '09123456796', '123');
 Customer customer8 = new Customer('Pari', 'Varparide', '09123456797', '123');
 Customer customer9 = new Customer('Abdollah', 'Nakhalaf', '09123456798', '123');
 Customer customer10 = new Customer('Amir', 'Booghi', '09123456799', '123');
 List<Customer> customer=[customer10,customer9,customer8,customer7,customer6,customer5,customer4,customer3,customer2,customer1];
 return customer;
}

Customer importCustomer(){
  List<Restaurant> restaurant=importRestaurant();
  Customer customer11 = new Customer('Ali', 'Alavi', '09123456790', '123');
  customer11.addShoppingCart(restaurant[0].getMenu()[0], restaurant[0].getId(), 1);
  customer11.addShoppingCart(restaurant[0].getMenu()[1], restaurant[0].getId(), 2);
  customer11.addShoppingCart(restaurant[0].getMenu()[2], restaurant[0].getId(), 3);
  customer11.getShoppingCart()[0].setRestaurantName(restaurant[0].getName());
  customer11.addShoppingCart(restaurant[1].getMenu()[2], restaurant[1].getId(), 1);
  customer11.addShoppingCart(restaurant[1].getMenu()[3], restaurant[1].getId(), 2);
  customer11.addShoppingCart(restaurant[1].getMenu()[4], restaurant[1].getId(), 3);
  customer11.getShoppingCart()[1].setRestaurantName(restaurant[1].getName());

  return customer11;
}
