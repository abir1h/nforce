import 'package:get/get.dart';

import '../controllers/line_item_controller.dart';

class LineItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LineItemController>(
      () => LineItemController(),
    );
  }
}
