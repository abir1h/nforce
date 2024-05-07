import 'package:get/get.dart';

import '../controllers/accounting_controller.dart';

class AccountingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountingController>(
      () => AccountingController(),
    );
  }
}
