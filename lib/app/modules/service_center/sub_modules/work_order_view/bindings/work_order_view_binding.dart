import 'package:get/get.dart';

import '../controllers/work_order_view_controller.dart';

class WorkOrderViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkOrderViewController>(
      () => WorkOrderViewController(),
    );
  }
}
