import 'package:customer_app/Objects/Food.dart';
import 'package:customer_app/Objects/Order.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<Restaurant> importRestaurent(){

  Restaurant restaurant1 = new Restaurant('akbar jooje',
      LatLng(35.717676891099835, 51.331243399093914), '09123456780', '1234');
  Restaurant restaurant2 = new Restaurant('asghar jooje',
      LatLng(35.717676891099835, 25.331243399093914), '09123456781', '1234');
  Restaurant restaurant3 = new Restaurant('Reihoon',
      LatLng(33.717676891099835, 25.331243399093914), '09123456782', '123');
  Restaurant restaurant4 = new Restaurant('javanan',
      LatLng(32.717676891099835, 25.331243399093914), '09123456783', '1234');
  Restaurant restaurant5 = new Restaurant('mostafa & abbas',
      LatLng(31.717676891099835, 25.331243399093914), '09123456784', '1234');
  Restaurant restaurant6 = new Restaurant('Daneshjoo',
      LatLng(35.717676891099835, 26.331243399093914), '09123456785', '1234');
  Restaurant restaurant7 = new Restaurant('bikaran',
      LatLng(35.717676891099835, 29.331243399093914), '09123456786', '1234');
  Restaurant restaurant8 = new Restaurant('Bahar',
      LatLng(35.717676891099835, 20.331243399093914), '09123456787', '1234');
  Restaurant restaurant9 = new Restaurant('topolooo',
      LatLng(36.717676891099835, 25.331243399093914), '09123456788', '1234');
  Restaurant restaurant10 = new Restaurant('mashti',
      LatLng(36.717676891099835, 24.331243399093914), '09123456789', '1234');


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

  List<Food> foodList1 = [food20,food18,food16,food14,food12];
  List<Food> foodList2 = [food10,food8,food6,food4,food2];
  List<Food> foodList3 = [food19,food17,food15,food13,food11];
  List<Food> foodList4 = [food9,food7,food5,food3,food1];
  List<Food> foodList5 = [food20,food19,food18,food17,food16];
  List<Food> foodList6 = [food15,food13,food11,food14,food12];
  List<Food> foodList7 = [food10,food9,food8,food7,food6];
  List<Food> foodList8 = [food5,food4,food3,food2,food1];
  List<Food> foodList9 = [food20,food15,food10,food5,food1];
  List<Food> foodList10 = [food15,food12,food9,food6,food3];

  for (Food food in foodList1) {
    food.setComment(
        'A list is an indexable collection of objects with a length. The indexes start from zero. It is possible to create growable or fixed-length lists. By default, we create growable lists with [].It is generally not allowed to modify the lists length (adding or removing elements) while an operation on the list is being performed, for example during a call to forEach or sort. Also, trying to change the length of a list during iteration leads to ConcurrentModificationError.');
  }






  for (Food food in foodList1) {
    food.setDescription(
          'The Map is an object that is used to represents a set of values as key-value pairs. '
              'In Map, both keys and values can be of any type of object, it is not necessary '
              'that the keys and values both of the same type.. In Map, each key can only occurs '
              'once, but the same value can be used multiple times. In Map, each of the value '
              'is associated with a unique key, and this key is used to accessed corresponding '
              'Map value. The Map can be defined by using curly braces ({ }) and values '
              'can be assigned and accessed using square braces ([]).');
    food.setComment(
        'A list is an indexable collection of objects with a length. The indexes start from zero. It is possible to create'
            ' growable or fixed-length lists. By default, we create growable lists with [].It is generally not allowed to '
            'modify the lists length (adding or removing elements) while an operation on the list is being performed, '
            'for example during a call to forEach or sort. Also, trying to change the length of a list during iteration '
            'leads to ConcurrentModificationError.');
    restaurant1.addMenu(food);
  }
  for (Food food in foodList2) {
    food.setDescription(
          'The Map is an object that is used to represents a set of values as key-value pairs. '
              'In Map, both keys and values can be of any type of object, it is not necessary '
              'that the keys and values both of the same type.. In Map, each key can only occurs '
              'once, but the same value can be used multiple times. In Map, each of the value '
              'is associated with a unique key, and this key is used to accessed corresponding '
              'Map value. The Map can be defined by using curly braces ({ }) and values '
              'can be assigned and accessed using square braces ([]).');
    food.setComment(
        'A list is an indexable collection of objects with a length. The indexes start from zero. It is possible to create'
            ' growable or fixed-length lists. By default, we create growable lists with [].It is generally not allowed to '
            'modify the lists length (adding or removing elements) while an operation on the list is being performed, '
            'for example during a call to forEach or sort. Also, trying to change the length of a list during iteration '
            'leads to ConcurrentModificationError.');

    restaurant2.addMenu(food);
  }
  for (Food food in foodList3) {
    food.setDescription(
          'The Map is an object that is used to represents a set of values as key-value pairs. '
              'In Map, both keys and values can be of any type of object, it is not necessary '
              'that the keys and values both of the same type.. In Map, each key can only occurs '
              'once, but the same value can be used multiple times. In Map, each of the value '
              'is associated with a unique key, and this key is used to accessed corresponding '
              'Map value. The Map can be defined by using curly braces ({ }) and values '
              'can be assigned and accessed using square braces ([]).');
    food.setComment(
        'A list is an indexable collection of objects with a length. The indexes start from zero. It is possible to create'
            ' growable or fixed-length lists. By default, we create growable lists with [].It is generally not allowed to '
            'modify the lists length (adding or removing elements) while an operation on the list is being performed, '
            'for example during a call to forEach or sort. Also, trying to change the length of a list during iteration '
            'leads to ConcurrentModificationError.');

    restaurant3.addMenu(food);
  }
  for (Food food in foodList4) {
    food.setDescription(
          'The Map is an object that is used to represents a set of values as key-value pairs. '
              'In Map, both keys and values can be of any type of object, it is not necessary '
              'that the keys and values both of the same type.. In Map, each key can only occurs '
              'once, but the same value can be used multiple times. In Map, each of the value '
              'is associated with a unique key, and this key is used to accessed corresponding '
              'Map value. The Map can be defined by using curly braces ({ }) and values '
              'can be assigned and accessed using square braces ([]).');

    food.setComment(
        'A list is an indexable collection of objects with a length. The indexes start from zero. It is possible to create'
            ' growable or fixed-length lists. By default, we create growable lists with [].It is generally not allowed to '
            'modify the lists length (adding or removing elements) while an operation on the list is being performed, '
            'for example during a call to forEach or sort. Also, trying to change the length of a list during iteration '
            'leads to ConcurrentModificationError.');

    restaurant3.addMenu(food);
  }
  for (Food food in foodList5) {
    food.setDescription(
          'The Map is an object that is used to represents a set of values as key-value pairs. '
              'In Map, both keys and values can be of any type of object, it is not necessary '
              'that the keys and values both of the same type.. In Map, each key can only occurs '
              'once, but the same value can be used multiple times. In Map, each of the value '
              'is associated with a unique key, and this key is used to accessed corresponding '
              'Map value. The Map can be defined by using curly braces ({ }) and values '
              'can be assigned and accessed using square braces ([]).');

    food.setComment(
        'A list is an indexable collection of objects with a length. The indexes start from zero. It is possible to create'
            ' growable or fixed-length lists. By default, we create growable lists with [].It is generally not allowed to '
            'modify the lists length (adding or removing elements) while an operation on the list is being performed, '
            'for example during a call to forEach or sort. Also, trying to change the length of a list during iteration '
            'leads to ConcurrentModificationError.');

    restaurant5.addMenu(food);
  }
  for (Food food in foodList6) {
    food.setDescription(
          'The Map is an object that is used to represents a set of values as key-value pairs. '
              'In Map, both keys and values can be of any type of object, it is not necessary '
              'that the keys and values both of the same type.. In Map, each key can only occurs '
              'once, but the same value can be used multiple times. In Map, each of the value '
              'is associated with a unique key, and this key is used to accessed corresponding '
              'Map value. The Map can be defined by using curly braces ({ }) and values '
              'can be assigned and accessed using square braces ([]).');

    food.setComment(
        'A list is an indexable collection of objects with a length. The indexes start from zero. It is possible to create'
            ' growable or fixed-length lists. By default, we create growable lists with [].It is generally not allowed to '
            'modify the lists length (adding or removing elements) while an operation on the list is being performed, '
            'for example during a call to forEach or sort. Also, trying to change the length of a list during iteration '
            'leads to ConcurrentModificationError.');

    restaurant6.addMenu(food);
  }
  for (Food food in foodList7) {
    food.setDescription(
          'The Map is an object that is used to represents a set of values as key-value pairs. '
              'In Map, both keys and values can be of any type of object, it is not necessary '
              'that the keys and values both of the same type.. In Map, each key can only occurs '
              'once, but the same value can be used multiple times. In Map, each of the value '
              'is associated with a unique key, and this key is used to accessed corresponding '
              'Map value. The Map can be defined by using curly braces ({ }) and values '
              'can be assigned and accessed using square braces ([]).');

    food.setComment(
        'A list is an indexable collection of objects with a length. The indexes start from zero. It is possible to create'
            ' growable or fixed-length lists. By default, we create growable lists with [].It is generally not allowed to '
            'modify the lists length (adding or removing elements) while an operation on the list is being performed, '
            'for example during a call to forEach or sort. Also, trying to change the length of a list during iteration '
            'leads to ConcurrentModificationError.');

    restaurant7.addMenu(food);
  }
  for (Food food in foodList8) {
    food.setDescription(
          'The Map is an object that is used to represents a set of values as key-value pairs. '
              'In Map, both keys and values can be of any type of object, it is not necessary '
              'that the keys and values both of the same type.. In Map, each key can only occurs '
              'once, but the same value can be used multiple times. In Map, each of the value '
              'is associated with a unique key, and this key is used to accessed corresponding '
              'Map value. The Map can be defined by using curly braces ({ }) and values '
              'can be assigned and accessed using square braces ([]).');

    food.setComment(
        'A list is an indexable collection of objects with a length. The indexes start from zero. It is possible to create'
            ' growable or fixed-length lists. By default, we create growable lists with [].It is generally not allowed to '
            'modify the lists length (adding or removing elements) while an operation on the list is being performed, '
            'for example during a call to forEach or sort. Also, trying to change the length of a list during iteration '
            'leads to ConcurrentModificationError.');

    restaurant8.addMenu(food);
  }
  for (Food food in foodList9) {
    food.setDescription(
          'The Map is an object that is used to represents a set of values as key-value pairs. '
              'In Map, both keys and values can be of any type of object, it is not necessary '
              'that the keys and values both of the same type.. In Map, each key can only occurs '
              'once, but the same value can be used multiple times. In Map, each of the value '
              'is associated with a unique key, and this key is used to accessed corresponding '
              'Map value. The Map can be defined by using curly braces ({ }) and values '
              'can be assigned and accessed using square braces ([]).');

    food.setComment(
        'A list is an indexable collection of objects with a length. The indexes start from zero. It is possible to create'
            ' growable or fixed-length lists. By default, we create growable lists with [].It is generally not allowed to '
            'modify the lists length (adding or removing elements) while an operation on the list is being performed, '
            'for example during a call to forEach or sort. Also, trying to change the length of a list during iteration '
            'leads to ConcurrentModificationError.');

    restaurant9.addMenu(food);
  }
  for (Food food in foodList10) {
    food.setDescription(
          'The Map is an object that is used to represents a set of values as key-value pairs. '
              'In Map, both keys and values can be of any type of object, it is not necessary '
              'that the keys and values both of the same type.. In Map, each key can only occurs '
              'once, but the same value can be used multiple times. In Map, each of the value '
              'is associated with a unique key, and this key is used to accessed corresponding '
              'Map value. The Map can be defined by using curly braces ({ }) and values '
              'can be assigned and accessed using square braces ([]).');

    food.setComment(
        'A list is an indexable collection of objects with a length. The indexes start from zero. It is possible to create'
            ' growable or fixed-length lists. By default, we create growable lists with [].It is generally not allowed to '
            'modify the lists length (adding or removing elements) while an operation on the list is being performed, '
            'for example during a call to forEach or sort. Also, trying to change the length of a list during iteration '
            'leads to ConcurrentModificationError.');

    restaurant10.addMenu(food);
  }

  Order order1=Order({food1:2,food4:1,food13:5,food20:1});
  Order order2=Order({food3:1,food6:1,food5:9});
  Order order3=Order({food5:1,food7:1,food13:3});
  Order order4=Order({food15:4,food10:1,food13:3});
  Order order5=Order({food18:2,food9:1,food19:4});
  Order order6=Order({food19:1,food2:5,food11:2,food16:3});
  Order order7=Order({food18:2,food4:1});
  Order order8=Order({food2:1,food4:1,food7:1,food6:2});
  Order order9=Order({food15:1,food5:2,food8:3});
  Order order10=Order({food14:4,food4:1,food10:2});
  Order order11=Order({food9:3,food10:5,food8:1});

  order1.setCustomerName('Ali Alavi');
  order2.setCustomerName('Naghi Naghavi');
  order3.setCustomerName('Soltan Soltani');
  order4.setCustomerName('Abbas Abbasi');
  order5.setCustomerName('Mostafa Mostafai');
  order6.setCustomerName('Gol Kharzare');
  order7.setCustomerName('Pari Varparide');
  order8.setCustomerName('Abdollah Nakhalaf');
  order9.setCustomerName('Amir Booghi');
  order10.setCustomerName('Noora Noori');
  order11.setCustomerName('Pari Varparide');

  order1.setCustomerAddressString('golbarg,kh kerman,pelak 34,vahed 2,salam bar hame daram talash mikonam ke matn ziadi benevisam :)');
  order2.setCustomerAddressString('golbarg,kh kerman,pelak 34,vahed 2,salam bar hame daram talash mikonam ke matn ziadi benevisam :)');
  order3.setCustomerAddressString('golbarg,kh kerman,pelak 34,vahed 2,salam bar hame daram talash mikonam ke matn ziadi benevisam :)');
  order4.setCustomerAddressString('golbarg,kh kerman,pelak 34,vahed 2,salam bar hame daram talash mikonam ke matn ziadi benevisam :)');
  order6.setCustomerAddressString('golbarg,kh kerman,pelak 34,vahed 2,salam bar hame daram talash mikonam ke matn ziadi benevisam :)');
  order5.setCustomerAddressString('golbarg,kh kerman,pelak 34,vahed 2,salam bar hame daram talash mikonam ke matn ziadi benevisam :)');
  order7.setCustomerAddressString('golbarg,kh kerman,pelak 34,vahed 2,salam bar hame daram talash mikonam ke matn ziadi benevisam :)');
  order8.setCustomerAddressString('golbarg,kh kerman,pelak 34,vahed 2,salam bar hame daram talash mikonam ke matn ziadi benevisam :)');
  order9.setCustomerAddressString('golbarg,kh kerman,pelak 34,vahed 2,salam bar hame daram talash mikonam ke matn ziadi benevisam :)');
  order10.setCustomerAddressString('golbarg,kh kerman,pelak 34,vahed 2,salam bar hame daram talash mikonam ke matn ziadi benevisam :)');
  order11.setCustomerAddressString('golbarg,kh kerman,pelak 34,vahed 2,salam bar hame daram talash mikonam ke matn ziadi benevisam :)');

  order1.setCustomerAddress(LatLng(34.717676891099835, 51.331243399093914));
  order2.setCustomerAddress(LatLng(35.717676891099835, 25.331243399093914));
  order3.setCustomerAddress(LatLng(33.717676891099835, 25.331243399093914));
  order4.setCustomerAddress(LatLng(32.717676891099835, 25.331243399093914));
  order5.setCustomerAddress(LatLng(31.717676891099835, 25.331243399093914));
  order6.setCustomerAddress(LatLng(35.717676891099835, 26.331243399093914));
  order7.setCustomerAddress(LatLng(35.731750523607964, 51.47188366660937));
  order8.setCustomerAddress(LatLng(35.717676891099835, 20.331243399093914));
  order9.setCustomerAddress(LatLng(36.717676891099835, 25.331243399093914));
  order10.setCustomerAddress( LatLng(36.717676891099835, 24.331243399093914));
  order11.setCustomerAddress( LatLng(35.731750523607964, 51.47188366660937));



  List orders=[
    order11,order10,order9,order8,order7,order6,order5,order4,order3,order2,order1
  ];

  for(Order order in orders){
    order.setRestaurentName(restaurant1.getName());
    order.setOrderTime();
    restaurant3.addOrder(order);
  }


  List<Restaurant> restaurant=[restaurant10,restaurant9,restaurant8,restaurant7,restaurant6,restaurant5,restaurant4,restaurant3,restaurant2,restaurant1];
  return restaurant;

}