import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class FullScreenMap extends StatefulWidget {
  const FullScreenMap({super.key});

  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  // final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  // final CameraPosition _kGooglePlex = const CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  @override
  Widget build(BuildContext context) {
    // MapboxMap? mapboxMap;

    // _onMapCreated(MapboxMap mpb) {
    //   mapboxMap = mpb;
    // }

    return Scaffold(
        // body: MapWidget(
        //   // mapType: MapType.hybrid,
        //   // initialCameraPosition: _kGooglePlex,
        //   // onMapCreated: (GoogleMapController controller) {
        //   //   _controller.complete(controller);
        //   // },
        //   onMapCreated: _onMapCreated,
        // ),
        );
  }
}
