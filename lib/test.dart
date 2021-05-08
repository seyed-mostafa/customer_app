import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



void main() {
  DateTime now = DateTime.now();
  print(now);
  String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
  print(formattedDate);
  dynamic currentTime = DateFormat.jm().format(DateTime.now());
  print(currentTime);
}