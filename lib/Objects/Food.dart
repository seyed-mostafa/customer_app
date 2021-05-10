

import 'Restaurant.dart';

class Food extends Restaurant{
  String _name, _description;
  num _discount, _price;
  bool _sizing, _available;
  TypeFood _typeFood;
  List<String> _comments = List.empty(growable: true);
  var _score = {"behdasht":null,"soratPeik":null,"garmiGhaza":null,"gheimat":null,"keifiat":null};



   Food(String name, String description,num price,num discount,bool sizing,bool available,TypeFood typeFood) : super('', null, '', '')  {
    this._name = name;
    if (discount!=null) {
      this._discount = discount;
    }
    this._description = description;
    this._price = price;
    this._sizing = sizing;
    this._available = available;
    this._typeFood = typeFood;
  }


  void setName(String name){
    this._name=name;
  }
  void setDescription(String description){
    this._description=description;
  }
  void setPrice(num price){
    this._price = price;
  }
  void setDiscount(num discount){
     if (discount!=null) {
       this._discount = discount;
     }
  }
  void setSizing(bool sizing){
    this._sizing = sizing;
  }
  void setAvailable(bool available){
    this._available = available;
  }
  void setTypeFood(TypeFood typeFood){
    this._typeFood = typeFood;
  }
  void setComment(String comment){
    this._comments.add(comment);
  }
  void setScore(int behdasht,int soratPeik,int garmiGhaza,int gheimat,int keifiat){
    if (_score["behdasht"]==null) {
      _score["behdasht"]=behdasht;
      _score["garmiGhaza"]=garmiGhaza;
      _score["soratPeik"]=soratPeik;
      _score["gheimat"]=gheimat;
      _score["keifiat"]=keifiat;
    }else{
      _score["behdasht"]=(behdasht+_score["behdasht"])/2;
      _score["garmiGhaza"]=(garmiGhaza+_score["garmiGhaza"])/2;
      _score["soratPeik"]=(soratPeik+_score["soratPeik"])/2;
      _score["gheimat"]=(gheimat+_score["gheimat"])/2;
      _score["keifiat"]=(keifiat+_score["keifiat"])/2;
    }
  }



  String getName(){
    return _name;
  }
  String getDescription(){
    return _description;
  }
  num getPrice(){
    return _price ;
  }
  num getDiscount(){
    return _discount ;
  }
  bool getSizing(){
    return _sizing ;
  }
  bool getAvailable(){
    return _available ;
  }
  TypeFood getTypeFood(){
    return _typeFood ;
  }
  List<String> getComment(){
    return _comments;
  }
  double getScore(){
    double score=0;
    for(double i in _score.values){
        score+=i;
    }
    return score/5;
  }
}




enum TypeFood{
   Pizza
  ,Sandwich
  ,Drinks
  ,PersianFood
  ,Dessert          //دسر
  ,Appetizer       //پیش غذا
  ,Fried           //سوخاری
  ,Steaks
  ,Breakfast
  ,International

}