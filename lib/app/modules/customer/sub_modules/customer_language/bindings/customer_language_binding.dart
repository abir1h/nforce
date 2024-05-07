import 'package:get/get.dart';

import '../controllers/customer_language_controller.dart';

class CustomerLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerLanguageController>(
      () => CustomerLanguageController(),
    );
  }
}
