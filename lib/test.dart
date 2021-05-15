import 'package:customer_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:customer_app/Objects/Food.dart';
import 'package:customer_app/Objects/Order.dart';
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:flutter/material.dart';

void main() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
  print(formattedDate);

  Restaurant restaurant1 = new Restaurant('akbar jooje',
      LatLng(35.717676891099835, 51.331243399093914), '09123456780', '1234');
  Restaurant restaurant2 = new Restaurant('asghar jooje',
      LatLng(35.717676891099835, 25.331243399093914), '09123456781', '1234');
  Restaurant restaurant3 = new Restaurant('reihoon',
      LatLng(33.717676891099835, 25.331243399093914), '09123456782', '123');
  Restaurant restaurant4 = new Restaurant('javanan',
      LatLng(32.717676891099835, 25.331243399093914), '09123456783', '1234');
  Restaurant restaurant5 = new Restaurant('mostafa & abbas',
      LatLng(31.717676891099835, 25.331243399093914), '09123456784', '1234');
  Restaurant restaurant6 = new Restaurant('daneshjoo',
      LatLng(35.717676891099835, 26.331243399093914), '09123456785', '1234');
  Restaurant restaurant7 = new Restaurant('bikaran',
      LatLng(35.717676891099835, 29.331243399093914), '09123456786', '1234');
  Restaurant restaurant8 = new Restaurant('bahar',
      LatLng(35.717676891099835, 20.331243399093914), '09123456787', '1234');
  Restaurant restaurant9 = new Restaurant('topolooo',
      LatLng(36.717676891099835, 25.331243399093914), '09123456788', '1234');
  Restaurant restaurant10 = new Restaurant('mashti',
      LatLng(36.717676891099835, 24.331243399093914), '09123456789', '1234');

  Customer customer1 = new Customer('Ali', 'Alavi', '09123456790', '123');
  Customer customer2 = new Customer('Naghi', 'Naghavi', '09123456791', '123');
  Customer customer3 = new Customer('Soltan', 'Soltani', '09123456792', '123');
  Customer customer4 = new Customer('Abbas', 'Abbasi', '09123456793', '123');
  Customer customer5 =
      new Customer('Mostafa', 'Mostafai', '09123456794', '123');
  Customer customer6 = new Customer('Gol', 'Kharzare', '09123456795', '123');
  Customer customer7 = new Customer('Noora', 'Noori', '09123456796', '123');
  Customer customer8 = new Customer('Pari', 'Varparide', '09123456797', '123');
  Customer customer9 =
      new Customer('Abdollah', 'Nakhalaf', '09123456798', '123');
  Customer customer10 = new Customer('Amir', 'Booghi', '09123456799', '123');

  Food food1 = Food(
      'ghorme', 'description1', 25000, null, false, true, TypeFood.PersianFood);
  Food food2 = Food(
      'gheime', 'description2', 30000, 20, false, true, TypeFood.PersianFood);
  Food food3 = Food(
      'makhsoos', 'description3', 25000, null, false, true, TypeFood.Pizza);
  Food food4 = Food(
      'sabzijat', 'description4', 25000, null, false, true, TypeFood.Pizza);
  Food food5 = Food(
      'hamberger', 'description5', 65000, 20, false, true, TypeFood.Sandwich);
  Food food6 = Food(
      'sosis', 'description6', 25000, null, false, true, TypeFood.Sandwich);
  Food food7 =
      Food('ab', 'description7', 25000, null, false, true, TypeFood.Drinks);
  Food food8 =
      Food('doogh', 'description8', 40000, 52, false, true, TypeFood.Drinks);
  Food food9 = Food(
      'bastany', 'description9', 25000, null, false, true, TypeFood.Dessert);
  Food food10 =
      Food('jely', 'description10', 25000, null, false, true, TypeFood.Dessert);
  Food food11 =
      Food('soop', 'description11', 25000, 60, false, true, TypeFood.Appetizer);
  Food food12 = Food(
      'fereny', 'description12', 25000, null, false, true, TypeFood.Appetizer);
  Food food13 = Food('morgh sokhary', 'description13', 80000, null, false, true,
      TypeFood.Fried);
  Food food14 = Food('gharch sorakhy', 'description14', 25000, null, false,
      true, TypeFood.Fried);
  Food food15 = Food('Medium Rare', 'description15', 15000, null, false, true,
      TypeFood.Steaks);
  Food food16 = Food(
      'T-bone Steak', 'description16', 25000, 20, false, true, TypeFood.Steaks);
  Food food17 = Food(
      'nimroo', 'description17', 5000, null, false, true, TypeFood.Breakfast);
  Food food18 = Food(
      'pancake', 'description18', 25000, null, false, true, TypeFood.Breakfast);
  Food food19 = Food('ghorme kharegy', 'description19', 25000, 50, false, true,
      TypeFood.International);
  Food food20 = Food('ghorme kharegy', 'description20', 8000, null, false, true,
      TypeFood.International);

  food1.setComment('comment');

  restaurant1.addMenu(food1);
  restaurant1.addMenu(food20);

  restaurant2.addMenu(food2);
  restaurant2.addMenu(food11);

  restaurant3.addMenu(food3);
  restaurant3.addMenu(food12);

  restaurant4.addMenu(food4);
  restaurant4.addMenu(food13);

  restaurant5.addMenu(food5);
  restaurant5.addMenu(food14);

  restaurant6.addMenu(food6);
  restaurant6.addMenu(food15);

  restaurant7.addMenu(food7);
  restaurant7.addMenu(food16);

  restaurant8.addMenu(food8);
  restaurant8.addMenu(food17);

  restaurant9.addMenu(food9);
  restaurant9.addMenu(food18);

  restaurant10.addMenu(food10);
  restaurant10.addMenu(food19);

  customer1.addShoppingCart(food1, 2);
  customer1.addShoppingCart(food10, 1);
  customer1.addShoppingCart(food5, 1);
  Order order1 = new Order(customer1.getShoppingCart());
  order1.setCustomerName(customer1.getName());
  for (Food food in order1.getOrder().keys) {
    print(food.getName());
  }
  customer1.setShoppingCartClear();
  print(order1.getPrice());

  // print(restaurant1.getId());
  // print(restaurant2.getId());
  // print(restaurant3.getId());
  // print(restaurant4.getId());
  // print(restaurant5.getId());
  // print(restaurant6.getId());
  // print(restaurant7.getId());
  // print(restaurant8.getId());
  // print(restaurant9.getId());

  print(restaurant1.getMenu()[0].getComment()[0]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _isEditingText = false;
  TextEditingController _editingController;



    @override
    void dispose() {
      _editingController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("'Editable Text"),
        ),
        body: Center(

        ),
      ),
    );
  }
}
