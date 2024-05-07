import 'package:get/get.dart';

import '../controllers/human_resource_controller.dart';

class HumanResourceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HumanResourceController>(
      () => HumanResourceController(),
    );
  }
}
