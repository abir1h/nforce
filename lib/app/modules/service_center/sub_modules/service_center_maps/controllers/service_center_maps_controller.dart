import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ServiceCenterMapsController extends GetxController {
  //TODO: Implement ServiceCenterMapsController
  late GoogleMapController googleMapController;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
