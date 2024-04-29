import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:nuforce/app/model/google_maps_places.dart';
import 'package:nuforce/app/model/place_details_model.dart';
import 'dart:developer' as developer show log;
import 'package:http/http.dart' as http;

import 'package:nuforce/app/utils/app_constants.dart';

class FullScreenMapController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getLocation();
    searchController.addListener(searchListener);
  }

  Rx<LatLng>? userCurrentLocation;
  GoogleMapController? mapController;
  TextEditingController searchController = TextEditingController();
  Rx<LatLng> focusPoint = AppConstants.defaultLocation.obs;
  RxBool isSearching = false.obs;
  Rx<FocusNode> searchFocus = FocusNode().obs;
  GoogleMapPlace? places;

  // Add a marker to the map
  RxSet<Marker> markers = <Marker>{}.obs;

  Future<void> getLocation() async {
    Location loca = Location();
    var locationData = await loca.getLocation();
    userCurrentLocation = LatLng(locationData.latitude!, locationData.longitude!).obs;
    focusPoint.value = userCurrentLocation?.value ?? AppConstants.defaultLocation;
    mapController?.animateCamera(CameraUpdate.newLatLng(focusPoint.value));
  }

  //Search
  Timer? searchActive;
  String? address;
  String searchQuery = '';
  Rx<PlaceDetails> selectedLocationDetails = PlaceDetails().obs;
  Rx<Predictions> selectedLocation = Predictions().obs;
  void searchListener() {
    developer.log('searchListener', name: 'searchListener');
    if (searchController.text.isEmpty) {
      places = null;
      isSearching.value = false;
    } else if (searchQuery != searchController.text) {
      isSearching.value = true;
      if (searchActive?.isActive ?? false) {
        searchActive?.cancel();
      }
      searchActive = Timer(const Duration(milliseconds: 500), () {
        if (searchController.text.isNotEmpty && searchController.text != searchQuery) {
          requestSearch(searchController.text);
        } else {
          isSearching.value = true;
          places = null;
        }
      });
    }
  }

  void requestSearch(String place) async {
    String searchKey = place;
    try {
      place = place.replaceAll(" ", "+");
      var endpoint = "https://maps.googleapis.com/maps/api/place/autocomplete/json?key=AIzaSyAujWWDfe6danzgRhbgQ0vY8lItGu9J5lM&input={$place}";
      endpoint += "&location=${userCurrentLocation?.value.latitude}," "${userCurrentLocation?.value.longitude}";
      final response = await http.get(Uri.parse(endpoint));
      if (response.statusCode != 200) {
        throw Error();
      }
      final responseJson = jsonDecode(response.body);
      if (responseJson['predictions'] == null) {
        throw Error();
      }
      isSearching.value = false;
      places = GoogleMapPlace.fromJson(responseJson);
      searchQuery = searchKey;
    } catch (e) {
      isSearching.value = false;
      places = null;
      developer.log(e.toString(), name: 'requestSearch');
    }
  }

  void getPlaceDetails(int index) async {
    try {
      places?.predictions?[index].loading = true;
      var endpoint = "https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyAujWWDfe6danzgRhbgQ0vY8lItGu9J5lM&place_id=${places?.predictions?[index].placeId}";

      final response = await http.get(Uri.parse(endpoint));

      if (response.statusCode != 200) {
        throw Error();
      }

      final responseJson = jsonDecode(response.body);
      if (responseJson['result'] == null) {
        throw Error();
      }
      places?.predictions?[index].loading = false;
      selectedLocationDetails.value = PlaceDetails.fromJson(responseJson);
      selectedLocation.value = places!.predictions![index];
      focusPoint.value = LatLng(selectedLocationDetails.value.result!.geometry!.location!.lat, selectedLocationDetails.value.result!.geometry!.location!.lng);
      searchController.text = places!.predictions![index].description!;
      searchQuery = places!.predictions![index].description!;
      mapController!.animateCamera(CameraUpdate.newLatLng(focusPoint.value));
      address = selectedLocation.value.description;
      places = null;
      isSearching.value = false;
      searchFocus.value.unfocus();
    } catch (e) {
      developer.log(e.toString(), name: 'getPlaceDetails');
    }
  }

  late bool serviceEnabled;
  late PermissionStatus permissionGranted;
  late LocationData locationData;
  LatLng userLocation = const LatLng(37.42796133580664, -122.085749655962);

  Future<void> getLocation() async {
    Location location = Location();

    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    try {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          if (Platform.isAndroid) return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted && Platform.isAndroid) {
          // showLocationEnableRequest();
          return;
        }
      }

      try {
        locationData = await location.getLocation().timeout(const Duration(seconds: 1));
        userLocation = LatLng(locationData.latitude!, locationData.longitude!);
      } catch (e) {
        developer.log('error: $e', name: 'splash_controller3');
      }
    } catch (e) {
      userLocation = const LatLng(37.42796133580664, -122.085749655962);
    }
  }
}
