import 'package:get/get.dart';

import '../controllers/service_items_controller.dart';

class ServiceItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceItemsController>(
      () => ServiceItemsController(),
    );
  }
}
