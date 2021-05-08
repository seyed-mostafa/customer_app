import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_map/flutter_map.dart';



Widget _PlacesSearchMapSample(){
  // 1
  Completer<GoogleMapController> _controller = Completer();
// 2
  static final CameraPosition _myLocation =
  CameraPosition(target: LatLng(0, 0),);
  return Scaffold(
    // 1
    body: GoogleMap(
      // 2
      initialCameraPosition: _myLocation,
      // 3
      mapType: MapType.normal,
      // 4
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    ),
  );

}