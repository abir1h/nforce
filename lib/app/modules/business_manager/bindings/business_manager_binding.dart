import 'package:get/get.dart';

import '../controllers/business_manager_controller.dart';

class BusinessManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusinessManagerController>(
      () => BusinessManagerController(),
    );
  }
}
