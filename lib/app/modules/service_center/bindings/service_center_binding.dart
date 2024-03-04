import 'package:get/get.dart';

import '../controllers/service_center_controller.dart';

class ServiceCenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceCenterController>(
      () => ServiceCenterController(),
    );
  }
}
