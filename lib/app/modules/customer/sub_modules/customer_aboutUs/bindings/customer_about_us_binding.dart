import 'package:get/get.dart';

import '../controllers/customer_about_us_controller.dart';

class CustomerAboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerAboutUsController>(
      () => CustomerAboutUsController(),
    );
  }
}
