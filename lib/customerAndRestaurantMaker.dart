

import 'package:customer_app/Objects/Food.dart';
import 'package:customer_app/Objects/Location.dart';
import 'package:customer_app/Objects/Restaurant.dart';
import 'package:customer_app/Objects/Comment.dart';
import 'package:customer_app/Objects/Customer.dart';
import 'package:customer_app/data/Data.dart';



customerAndRestaurantMaker(String messageServer) async {
  List<String> data = messageServer.split("&");

  //for (String strig in data) print(strig);

  Data.customer = new Customer(data[0], data[1], data[2], data[3]);
  //firstName  0
  //lastName    1
  //phoneNumber  2
  //password     3
  Data.customer.setWallet(int.parse(data[4])); //wallet
  Data.customer.addAddress(
      new Location(data[5], double.parse(data[6]), double.parse(data[7])));
  // print("and here");

  ////////////////////         comment         ///////////////////

  List<String> comments = data[8].split("^^"); //comments

  for (int i = 0; i < comments.length; i++) {
    List<String> comment = comments[i].split("^");
    // comment          0
    //restaurantName    1
    //commentTime       2
    //reply             3
    //replyTime         4

    if (comment.contains("null")) {
      Data.customer.addComment(
          new Comment.noFull(comment[0], data[0], comment[1], comment[2]));
    } else {
      Data.customer.addComment(new Comment.full(comment[0], data[0],
          comment[1], comment[2], comment[3], comment[4]));
    }
  }

  ////////////////////////             favoriteRestaurant          ///////////////

  List<String> favoriteRestaurants = data[9].split("^");
  for (int i = 0; i < favoriteRestaurants.length; i++) {
    Data.customer.addFavoriteRestaurant(int.parse(favoriteRestaurants[i]));
  }

  /////////////////////////               shoppingCart            ////////////////

  List<String> shoppingCarts = data[10].split("^^");
  for (String str in shoppingCarts) {
    List<String> shoppingCart = str.split("^");
    Data.customer.addNewShoppingCart(
        shoppingCart[0].substring(5),
        Data.customer.getName(),
        shoppingCart[2],
        Data.customer.getAddress()[0],
        new Location(shoppingCart[3], double.parse(shoppingCart[5]),
            double.parse(shoppingCart[4])),
        int.parse(shoppingCart[1]));
    List<String> foods = shoppingCart[6].split(":::");
    foods.removeLast();
    for (String food in foods) {
      List<String> f = food.split("::");
      Data.customer.addShoppingCart(
          new Food(
              f[0],
              f[1],
              int.parse(f[2]),
              int.parse(f[3]),
              null,
              f[4] == "true" ? true : false,
              TypeFood.values
                  .firstWhere((e) => e.toString() == "TypeFood." + f[5])),
          int.parse(shoppingCart[1]),
          int.parse(f[6]));
    }
    if (str.startsWith("true")) {
      //check status of order
      Data.customer.getShoppingCart().last.setDelivered();
    }
  }


  /////////////////////////               Orders            ////////////////

  // List<String> orders = data[11].split("^^");
  // for (String str in orders) {
  //   List<String> order = str.split("^");
  //   Data.customer.addNewShoppingCart(
  //       order[0].substring(5),
  //       Data.customer.getName(),
  //       order[2],
  //       Data.customer.getAddress()[0],
  //       new Location(
  //           order[3], double.parse(order[5]), double.parse(order[4])),
  //       int.parse(order[1]));
  //   List<String> foods = order[6].split(":::");
  //   foods.removeLast();
  //   for (String food in foods) {
  //     List<String> f = food.split("::");
  //     Data.customer.addShoppingCart(
  //         new Food(
  //             f[0],
  //             f[1],
  //             int.parse(f[2]),
  //             int.parse(f[3]),
  //             null,
  //             f[4] == "true" ? true : false,
  //             TypeFood.values.firstWhere((e) =>  e.toString() == "TypeFood."+f[5])),
  //         int.parse(order[1]),
  //         int.parse(f[6]));
  //   }1
  //   Data.customer.getShoppingCart().last.setDelivered();
  // }

  ////////////////////////////////////////////////////////              restaurants data        from data : 11             /////////////////////////////////

  //print(data[11]);
  List<String> string = data[11].split("##");
    for (String s in string) print(s);
  for(String str in string) {
    List<String> data1=str.split("#");
  Restaurant restaurant = new Restaurant(
      data1[0],
      new Location(data1[1], double.parse(data1[3]), double.parse(data1[2])),
      data1[4],
      data1[5]);
  restaurant.setSendingRangeRadius(int.parse(data1[6]));
  restaurant.setId(int.parse(data1[7]));
  restaurant.setDays(data1[8]);
  restaurant.setHour(data1[9]);

  /////////////////////////////////                       type food            /////////////////////

  List<String> type = data1[10].split("::");
  for (String string in type) {
    restaurant.addTypeFood(TypeFood.values
        .firstWhere((e) => e.toString() == "TypeFood." + string));
  }

  /////////////////////////////////                       menu            /////////////////////

  List<String> foods = data1[11].split(":::");
  for (String food in foods) {
    List<String> menu = food.split("::");
    restaurant.addMenu(new Food(
        menu[0],
        menu[1],
        int.parse(menu[2]),
        int.parse(menu[3]),
        null,
        menu[4] == "true" ? true : false,
        TypeFood.values
            .firstWhere((e) => e.toString() == "TypeFood." + menu[5])));
  }

  /////////////////////////////////                   comments           /////////////////////

  List<String> comments1 = data1[12].split(":::");
  for (String com in comments1) {
    List<String> comment = com.split("::");
    if (comment.length == 6)
      restaurant.addComment(new Comment.full(comment[0], comment[1],
          comment[2], comment[3], comment[4], comment[5]));
    else
      restaurant.addComment(
          new Comment.noFull(comment[0], comment[1], comment[2], comment[3]));
  }
  Data.restaurants.add(restaurant);
}
print(Data.restaurants.length);

  /////////////////////////////////                   orders           /////////////////////

  // List<String> orders = data1[13].split("^^");
  // for (String ord in orders) {
  //   List<String> order = ord.split("^");
  //   restaurant.addOrder();
  //   for (String food in foods1) {
  //     List<String> menu = food.split("::");
  //
  //   }
  // }
}