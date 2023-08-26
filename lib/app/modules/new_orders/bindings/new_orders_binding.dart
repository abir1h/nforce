import 'package:get/get.dart';

import '../controllers/new_orders_controller.dart';

class NewOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewOrdersController>(
      () => NewOrdersController(),
    );
  }
}
