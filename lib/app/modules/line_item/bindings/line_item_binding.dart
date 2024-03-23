import 'package:get/get.dart';
import 'package:nuforce/app/modules/line_item/controllers/line_item_form_controller.dart';

import '../controllers/line_item_controller.dart';

class LineItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LineItemController>(
      () => LineItemController(),
    );
    Get.lazyPut<LineItemFormController>(
      () => LineItemFormController(),
    );
  }
}
