import 'package:get/get.dart';

import '../controllers/work_order_controller.dart';

class WorkOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkOrderController>(
      () => WorkOrderController(),
    );
  }
}
