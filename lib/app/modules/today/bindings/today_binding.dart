import 'package:get/get.dart';

import 'package:nuforce/app/modules/today/controllers/today_controller.dart';

class TodayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodayController>(
      () => TodayController(),
    );
  }
}
