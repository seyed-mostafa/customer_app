import 'dart:core';
import 'dart:math';

class Location {
  String _address;
  double _longitude;
  double _latitude;

  Location(String address, double latitude, double longitude) {
    this._address = address;
    this._longitude = longitude;
    this._latitude = latitude;
  }

  Location getLocation() {
    return this;
  }

  String getAddress() {
    return _address;
  }

  double getLongitude() {
    return _longitude;
  }

  double getLatitude() {
    return _latitude;
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742000 * asin(sqrt(a));
  }
}
