
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show cos, sqrt, asin;




void main(){
LatLng l1= LatLng(35.752533908867626, 51.53173725089658);
LatLng l2=LatLng(35.733026291127416, 51.517516406104534);
print(calculateDistance(l1.latitude, l1.longitude, l2.latitude, l2.longitude));

}



double calculateDistance(lat1, lon1, lat2, lon2){
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 - c((lat2 - lat1) * p)/2 +
      c(lat1 * p) * c(lat2 * p) *
          (1 - c((lon2 - lon1) * p))/2;
  return 12742000 * asin(sqrt(a));
}



