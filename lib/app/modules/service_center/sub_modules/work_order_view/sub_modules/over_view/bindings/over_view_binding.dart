import 'package:get/get.dart';

import '../controllers/over_view_controller.dart';

class OverViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OverViewController>(
      () => OverViewController(),
    );
  }
}
