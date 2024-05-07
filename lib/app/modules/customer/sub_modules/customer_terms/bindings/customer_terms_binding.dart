import 'package:get/get.dart';

import '../controllers/customer_terms_controller.dart';

class CustomerTermsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerTermsController>(
      () => CustomerTermsController(),
    );
  }
}
