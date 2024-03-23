import 'package:get/get.dart';

import '../controllers/calendar_controller.dart';

class ServiceCenterCalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceCenterCalendarController>(
      () => ServiceCenterCalendarController(),
    );
  }
}
