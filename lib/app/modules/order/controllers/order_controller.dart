import 'package:get/get.dart';

class OrderController extends GetxController {
  OrderTabEnum tabEnum = OrderTabEnum.overview;

  void updateTabEnum(OrderTabEnum tab) {
    tabEnum = tab;
    update();
  }
}

enum OrderTabEnum {
  overview,
  invoices,
  schedules,
  locations,
  policies,
}
