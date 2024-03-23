import 'package:get/get.dart';

import '../controllers/customer_work_order_controller.dart';

class CustomerWorkOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerWorkOrderController>(
      () => CustomerWorkOrderController(),
    );
  }
}
