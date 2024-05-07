import 'package:get/get.dart';

import '../controllers/customer_payment_history_controller.dart';

class CustomerPaymentHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerPaymentHistoryController>(
      () => CustomerPaymentHistoryController(),
    );
  }
}
