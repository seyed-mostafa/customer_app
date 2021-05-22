
import 'package:customer_app/Objects/Food.dart';

class Comment extends Food {
  String _comment1,_comment2;
  DateTime _dateTime1,_dateTime2;

  Comment(String comment1) : super('', '', null, null, false, false, null){
    this._comment1=comment1;
    _dateTime1= DateTime.now();
  }
  void setComment2(String comment2){
    this._comment1=comment2;
    _dateTime2= DateTime.now();
  }
  String getComment1(){
    return _comment1;
  }
  String getComment2(){
    return _comment2;
  }
  DateTime getDateTime1(){
    return _dateTime1;
  }
  DateTime getDateTime2(){
    return _dateTime2;
  }
}