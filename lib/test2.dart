import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapView(),
    );
  }
}

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController mapController;



  @override
  Widget build(BuildContext context) {
    // Determining the screen width & height
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ClipOval(
              child: Material(
                color: Colors.orange[100], // button color
                child: InkWell(
                  splashColor: Colors.orange, // inkwell color
                  child: SizedBox(
                    width: 56,
                    height: 56,
                    child: Icon(Icons.my_location),
                  ),
                  onTap: () {
                    // TODO: Add the operation to be performed
                    // on button tap
                  },
                ),
              ),
            )
            ,

            // SafeArea(
            //   child: Align(
            //     alignment: Alignment.bottomRight,
            //     child: Padding(
            //       padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
            //       child: ClipOval(
            //         child: Material(
            //           color: Colors.orange[100], // button color
            //           child: InkWell(
            //             splashColor: Colors.orange, // inkwell color
            //             child: SizedBox(
            //               width: 56,
            //               height: 56,
            //               child: Icon(Icons.my_location),
            //             ),
            //             onTap: () {
            //               mapController.animateCamera(
            //                 CameraUpdate.newCameraPosition(
            //                   CameraPosition(
            //                     target: LatLng(
            //                       _currentPosition.latitude,
            //                       _currentPosition.longitude,
            //                     ),
            //                     zoom: 18.0,
            //                   ),
            //                 ),
            //               );
            //             },
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            GoogleMap(
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
          ],
        ),
      ),
    );
  }
}