import 'package:get/get.dart';

import '../controllers/customer_faq_controller.dart';

class CustomerFaqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerFaqController>(
      () => CustomerFaqController(),
    );
  }
}
