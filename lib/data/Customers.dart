
import 'package:customer_app/Objects/Comment.dart';
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Food.dart';
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
  for(Food food in restaurant[0].getMenu()){
  customer11.addFavoriteFood(food);
  }
  customer11.addFavoriteRestaurant(restaurant[1]);
  customer11.addFavoriteRestaurant(restaurant[3]);
  customer11.addFavoriteRestaurant(restaurant[5]);


  Comment comment=new Comment("ai khoda");
  Comment comment2=new Comment("man dige rad dadam");
  Comment comment3=new Comment("as dast in flutter");
  Comment comment4=new Comment("ki bood migoft konkor ro bedin dige daneshgah rahate?");
  Comment comment5=new Comment("khoda azab shab aval ghabresh ro ziad kone ");
  Comment comment6=new Comment("khob dige dar mored chi benevisam");
  Comment comment7=new Comment("fek konam baray comment ha bas bashe");
  Comment comment8=new Comment("pas fellan khodahaffez :)))");
  comment.setCustomerName("Abbas");
  comment2.setCustomerName("Mostafa");
  comment3.setCustomerName("Ali");
  comment4.setCustomerName("Hasan");
  comment5.setCustomerName("Abbas");
  comment6.setCustomerName("Mostafa");
  comment7.setCustomerName("Ali");
  comment8.setCustomerName("Hasan");

  comment.setRestaurantName('akbar jooje');
  comment2.setRestaurantName('akbar jooje');
  comment3.setRestaurantName('akbar jooje');
  comment4.setRestaurantName('akbar jooje');
  comment5.setRestaurantName('akbar jooje');
  comment6.setRestaurantName('akbar jooje');
  comment7.setRestaurantName('akbar jooje');
  comment8.setRestaurantName('akbar jooje');
  comment2.setReply("khob be darak :|");

  customer11.addComment(comment);
  customer11.addComment(comment2);
  customer11.addComment(comment3);
  customer11.addComment(comment4);
  customer11.addComment(comment5);
  customer11.addComment(comment6);
  customer11.addComment(comment7);
  customer11.addComment(comment8);





  customer11.addShoppingCart(restaurant[0].getMenu()[0], restaurant[0].getId(), 1);
  customer11.addShoppingCart(restaurant[0].getMenu()[1], restaurant[0].getId(), 2);
  customer11.addShoppingCart(restaurant[0].getMenu()[2], restaurant[0].getId(), 3);
  customer11.getShoppingCart()[0].setRestaurantName(restaurant[0].getName());
  customer11.getShoppingCart()[0].setRestaurantAddressString(" Tehran Province, Tehran, District 7, Mir Emad St &, Shahid Motahari St");

  customer11.addShoppingCart(restaurant[1].getMenu()[2], restaurant[1].getId(), 1);
  customer11.addShoppingCart(restaurant[1].getMenu()[3], restaurant[1].getId(), 2);
  customer11.addShoppingCart(restaurant[1].getMenu()[4], restaurant[1].getId(), 3);
  customer11.getShoppingCart()[1].setRestaurantName(restaurant[1].getName());
  customer11.getShoppingCart()[1].setRestaurantAddressString( "Tehran Province, Tehran, District 7, Mir Emad St &, Shahid Motahari St");


Order order1 = new Order(restaurant[2].getMenu()[2], restaurant[2].getId(), 1);
order1.addFood(restaurant[2].getMenu()[3], 2);
order1.addFood(restaurant[2].getMenu()[4], 4);
customer11.addPreviousOrders(order1);
customer11.getPreviousOrders()[0].setRestaurantName(restaurant[2].getName());
customer11.getPreviousOrders()[0].setRestaurantAddressString( "Tehran Province, Tehran, District 7, Mir Emad St &, Shahid Motahari St");

  Order order2 = new Order(restaurant[3].getMenu()[2], restaurant[3].getId(), 4);
  order2.addFood(restaurant[3].getMenu()[1], 2);
  order2.addFood(restaurant[3].getMenu()[3], 1);
  order2.setDelivered();
  customer11.addPreviousOrders(order2);
  customer11.getPreviousOrders()[1].setRestaurantName(restaurant[3].getName());
  customer11.getPreviousOrders()[1].setRestaurantAddressString( "Tehran Province, Tehran, District 7, Mir Emad St &, Shahid Motahari St");



  customer11.setWallet(300000);
  return customer11;
}



