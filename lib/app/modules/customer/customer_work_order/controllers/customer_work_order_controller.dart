import 'package:get/get.dart';

class CustomerWorkOrderController extends GetxController {
  WorkOrderTabEnum tabEnum = WorkOrderTabEnum.overview;

  void updateTabEnum(WorkOrderTabEnum tab) {
    tabEnum = tab;
    update();
  }
}

enum WorkOrderTabEnum {
  overview,
  invoices,
  schedules,
  locations,
  policies,
}
