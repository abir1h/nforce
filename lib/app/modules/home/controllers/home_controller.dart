import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<MiniTabIndexEnum> miniTabIndex = MiniTabIndexEnum.today.obs;
}

enum MiniTabIndexEnum {
  today,
  actions,
  performance,
  invoices,
}
