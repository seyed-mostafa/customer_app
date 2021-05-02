import 'Address.dart';
import 'Food.dart';

class costomer{
String _firstName,_lastName,_phoneNumber,_password;
num _wallet=0;

List<Address> _address = List.empty(growable: true);
List<Food> _previosOrders = List.empty(growable: true); /////   احتمالا باید تغییر کنه
List<String> _comment = List.empty(growable: true);    //        ///     باید علاوه بر نظر ، غذا هم ثبت بشه :|
List<int> _favoriteRestaurentId = List.empty(growable: true);
List<Food> _shoppingCart = List.empty(growable: true);


void setName(String fname) {
  this._firstName = fname;
}

void setLastName(String lname) {
  this._lastName = lname;
}

void setPhoneNumber(String phoneNumber) {
  this._phoneNumber = phoneNumber;
}

void setPassword(String password) {
  this._password = password;
}
void setWallet(num wallet) {
  this._wallet = wallet;
}
void addAdres(Address address) {
  this._address.add(address);
}
void addPreviosOrders(Food food) {
  this._previosOrders.add(food);
}
void addComment(String comment) {
  this._comment.add(comment);
}
void addFavoriteRestaurentId(int favoriteRestaurentId) {
  this._favoriteRestaurentId.add(favoriteRestaurentId);
}
void addShoppingCart(Food shoppingCart) {
  this._shoppingCart.add(shoppingCart);
}



String getName() {
  return _firstName ;
}

String getLastName() {
  return _lastName ;
}

String getPhoneNumber() {
  return _phoneNumber ;
}

String getPassword() {
  return _password ;
}
num getWallet() {
  return _wallet ;
}
List<Address> getAdres() {
  return _address;
}
List<Food> getPreviosOrders() {
  return _previosOrders;
}
List<String> getComment() {
  return _comment;
}
List<int> getFavoriteRestaurentId() {
  return _favoriteRestaurentId;
}
List<Food> getShoppingCart() {
  return _shoppingCart;
}


}