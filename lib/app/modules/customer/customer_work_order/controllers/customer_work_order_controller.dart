import 'package:get/get.dart';

class CustomerWorkOrderController extends GetxController {
  WorkOrderTabEnum tabEnum = WorkOrderTabEnum.overview;
  SchedulesTabEnum tabEnumSchedule = SchedulesTabEnum.calendar;

  void updateTabEnum(WorkOrderTabEnum tab) {
    tabEnum = tab;
    update();
  }

  void updateScheduleTabEnum(SchedulesTabEnum tab) {
    tabEnumSchedule = tab;
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

enum SchedulesTabEnum {
  calendar,
  timeline,
  map,
}
