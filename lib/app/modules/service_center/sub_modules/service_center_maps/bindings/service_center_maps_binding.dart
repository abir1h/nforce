import 'package:get/get.dart';

import '../controllers/service_center_maps_controller.dart';

class ServiceCenterMapsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceCenterMapsController>(
      () => ServiceCenterMapsController(),
    );
  }
}
