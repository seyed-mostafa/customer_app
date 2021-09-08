import 'package:intl/intl.dart';

class Comment {
  String _comment,
      _reply,
      _customerName,
      _restaurantName,
      _timeComment,
      _timeReply;

  Comment.full(String comment, String customerName, String restaurantName,
      String timeComment, String reply, String timeReply) {
    _comment = comment;
    _customerName = customerName;
    _restaurantName = restaurantName;
    _timeComment = timeComment;
    _reply = reply;
    _timeReply = timeReply;
  }
  Comment.noFull(String comment, String customerName, String restaurantName,
      String timeComment) {
    _comment = comment;
    _customerName = customerName;
    _restaurantName = restaurantName;
    _timeComment = timeComment;
  }

  Comment(String comment) {
    this._comment = comment;
    _timeComment = DateFormat('d MMM kk:mm').format(DateTime.now());
  }
  void setReply(String reply) {
    this._reply = reply;
    _timeReply = DateFormat('d MMM kk:mm').format(DateTime.now());
  }

  void setRestaurantName(String restaurantName) {
    _restaurantName = restaurantName;
  }

  void setCustomerName(String customerName) {
    _customerName = customerName;
  }

  String getComment() {
    return _comment;
  }

  String getReply() {
    return _reply;
  }

  String getRestaurantName() {
    return _restaurantName;
  }

  String getCustomerName() {
    return _customerName;
  }

  String getTimeComment() {
    return _timeComment;
  }

  String getTimeReply() {
    return _timeReply;
  }
}
