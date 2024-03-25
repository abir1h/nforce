import 'package:get/get.dart';

import '../controllers/estimation_controller.dart';

class EstimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EstimationController>(
      () => EstimationController(),
    );
  }
}
