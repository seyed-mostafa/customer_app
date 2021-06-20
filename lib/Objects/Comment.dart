

class Comment  {
  String _comment,_reply,_customerName,_restaurantName;
  DateTime _timeComment,_timeReply;

  Comment.full(String comment,String restaurantName,DateTime timeComment,String reply,DateTime timeReply){
    _comment=comment;
    _restaurantName=restaurantName;
    _timeComment=timeComment;
    _reply=reply;
    _timeReply=timeReply;
  }

  Comment(String comment) {
    this._comment=comment;
    _timeComment= DateTime.now();
  }
  void setReply(String reply){
    this._reply=reply;
    _timeReply= DateTime.now();
  }
  void setRestaurantName(String restaurantName){
    _restaurantName=restaurantName;
  }
  void setCustomerName(String customerName){
    _customerName=customerName;
  }
  String getComment(){
    return _comment;
  }
  String getReply(){
    return _reply;
  }
  String getRestaurantName(){
    return _restaurantName;
  }
  String getCustomerName(){
    return _customerName;
  }
  DateTime getTimeComment(){
    return _timeComment;
  }
  DateTime getTimeReply(){
    return _timeReply;
  }
}