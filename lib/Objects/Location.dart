import 'dart:core';
import 'dart:math';

class Location {
  String _address;
  double _longitude, _latitude;

  Location(String address, double latitude, double longitude) {
    this._address = address;
    this._longitude = longitude;
    this._latitude = latitude;
  }

  String getAddress() {
    return _address;
  }

  Location getLocation() {
    return this;
  }

  double getLatitude() {
    return _latitude;
  }

  double getLongitude() {
    return _longitude;
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742000 * asin(sqrt(a));
  }
}
