import 'package:get/get.dart';

import '../controllers/work_order_search_controller.dart';

class WorkOrderSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkOrderSearchController>(
      () => WorkOrderSearchController(),
    );
  }
}
