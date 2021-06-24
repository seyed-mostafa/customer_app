

import 'dart:core';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location{

  String _address;
  double _longitude,_latitude;

  Location(String address, double latitude,double  longitude){
    this._address=address;
    this._longitude=longitude;
    this._latitude=latitude;
  }

   String getAddress() {
    return _address;
  }

   Location getLocation(){
    return this;
  }

   double getLatitude() {
    return _latitude;
  }

   double getLongitude() {
    return _longitude;
  }
}