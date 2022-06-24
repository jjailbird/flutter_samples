import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:base/src/constants.dart';
import 'package:location/location.dart';

class OrderTrakingPage extends StatefulWidget {
  const OrderTrakingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrakingPage> createState() => _OrderTrakingPageState();
}

class _OrderTrakingPageState extends State<OrderTrakingPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng originLocation = LatLng(37.5283144, 126.8146532);
  static const LatLng destinationLocation = LatLng(37.527672, 126.829852);
  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  void setCurrentLocation() {
    Location location = Location();

    location.getLocation().then((location) {
      currentLocation = location;
    });

    location.onLocationChanged.listen((location) {
      currentLocation = location;
      setState(() {});
    });
  }

  void setPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult polylineResult =
        await polylinePoints.getRouteBetweenCoordinates(
            googleApiKey,
            PointLatLng(originLocation.latitude, originLocation.longitude),
            PointLatLng(
                destinationLocation.latitude, destinationLocation.longitude));
    
    if (polylineResult.points.isNotEmpty) {
      for (var point in polylineResult.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    setCurrentLocation();
    setPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Track order",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: currentLocation == null
          ? const Center(child: Text("Loading"))
          : GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!), zoom: 14.5),
              polylines: {
                Polyline(
                  polylineId: const PolylineId("route"),
                  points: polylineCoordinates,
                  // color: Colors.deepPurple,
                  // width: 6,
                )
              },
              markers: {
                Marker(
                  markerId: const MarkerId("currentLocation"),
                  position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                ),
                const Marker(
                  markerId: MarkerId("source"),
                  position: originLocation,
                ),
                const Marker(
                  markerId: MarkerId("destination"),
                  position: destinationLocation,
                )
              },
            ),
    );
  }
}
