import 'package:get/get.dart';

import '../controllers/business_customer_controller.dart';

class BusinessCustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusinessCustomerController>(
      () => BusinessCustomerController(),
    );
  }
}
