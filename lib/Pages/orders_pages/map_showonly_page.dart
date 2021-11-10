import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:customer_app/constants/theme.dart';
import 'package:customer_app/constants/appbar.dart';
import 'package:customer_app/Objects/Order.dart';

class MapShowOnlyPage extends StatefulWidget {
  final Order order;
  MapShowOnlyPage(this.order);
  LatLng show;
  @override
  _MapShowOnlyPageState createState() => _MapShowOnlyPageState();
}

class _MapShowOnlyPageState extends State<MapShowOnlyPage> {
  final Set<Marker> _markers = {};

  Completer<GoogleMapController> _controller = Completer();
  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onCameraMove(CameraPosition position) {
    widget.show = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void first() {
    LatLng _lastMapPosition = new LatLng(
        widget.order.getCustomerAddress().getLatitude(),
        widget.order.getCustomerAddress().getLongitude());
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          snippet: widget.order.getCustomerAddress().getAddress(),
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.show = new LatLng(widget.order.getCustomerAddress().getLatitude(),
        widget.order.getCustomerAddress().getLongitude());
    first();
    return Scaffold(
      appBar: appBar(context),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: new LatLng(
                  widget.order.getCustomerAddress().getLatitude(),
                  widget.order.getCustomerAddress().getLongitude()),
              zoom: 17,
            ),
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
            zoomControlsEnabled: true,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: _onMapTypeButtonPressed,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: theme.yellow,
                    child: const Icon(Icons.map, size: 36.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
