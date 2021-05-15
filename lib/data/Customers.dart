
import 'package:customer_app/Objects/Customer.dart';

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