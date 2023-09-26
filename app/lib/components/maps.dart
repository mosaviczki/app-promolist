import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController mapController;
  double lat = -25.072556;
  double long = -50.152239;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    var markers = {
      const Marker(
          markerId: MarkerId('1'),
          position: LatLng(-25.0739148, -50.1533899),
          infoWindow: InfoWindow(title: 'Tozetto', snippet: '350,00')),
      const Marker(
          markerId: MarkerId('2'),
          position: LatLng(-25.072164, -50.150362),
          infoWindow: InfoWindow(title: 'Condor', snippet: '315,00')),
      const Marker(
          markerId: MarkerId('3'),
          position: LatLng(-25.069979, -50.147477),
          infoWindow: InfoWindow(title: 'MaxAtacadista', snippet: '335,00')),
    };

    return Scaffold(
        body: GoogleMap(
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            markers: markers,
            initialCameraPosition: CameraPosition(
              target: LatLng(lat, long),
              zoom: 17.0,
            )));
  }
}
