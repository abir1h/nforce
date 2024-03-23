import 'package:get/get.dart';

class AgentCustomerAuthController extends GetxController {
  int tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
