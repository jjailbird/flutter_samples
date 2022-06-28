import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:base/src/constants.dart';
import 'package:location/location.dart';

class OrderTrakingGoogleMapPage extends StatefulWidget {
  const OrderTrakingGoogleMapPage({Key? key}) : super(key: key);

  @override
  State<OrderTrakingGoogleMapPage> createState() => _OrderTrakingGoogleMapPageState();
}

class _OrderTrakingGoogleMapPageState extends State<OrderTrakingGoogleMapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  // Set<Marker> markers = {};

  static const LatLng originLocation = LatLng(37.5293, 126.8186);
  static const LatLng destinationLocation = LatLng(37.5277, 126.8299);
  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;
  BitmapDescriptor markerHome = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerGreen = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerBlue = BitmapDescriptor.defaultMarker;

  void loadMarkers() async {
    markerHome = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/maps/home_icon.64x64.png");
    markerGreen = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(),
        "assets/images/maps/marker_green.64x64.png");
    markerBlue = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), "assets/images/maps/marker_blue.64x64.png");
  }

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
    loadMarkers();
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
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      currentLocation!.latitude!, currentLocation!.longitude!),
                  zoom: 14.5),
              polylines: {
                Polyline(
                  polylineId: const PolylineId("route"),
                  points: polylineCoordinates,
                  color: Colors.deepPurple,
                  width: 6,
                )
              },
              markers: {
                Marker(
                  markerId: const MarkerId("currentLocation"),
                  position: LatLng(
                      currentLocation!.latitude!, currentLocation!.longitude!),
                  icon: markerHome,
                ),
                Marker(
                  markerId: const MarkerId("source"),
                  position: originLocation,
                  icon: markerGreen,
                ),
                Marker(
                  markerId: const MarkerId("destination"),
                  position: destinationLocation,
                  icon: markerBlue,
                )
              },
            ),
    );
  }
}
