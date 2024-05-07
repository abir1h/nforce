import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomerWorkOrderController extends GetxController {
  WorkOrderTabEnum tabEnum = WorkOrderTabEnum.overview;
  SchedulesTabEnum tabEnumSchedule = SchedulesTabEnum.calendar;
  late GoogleMapController googleMapController;


  void updateTabEnum(WorkOrderTabEnum tab) {
    tabEnum = tab;
    update();
  }

  void updateScheduleTabEnum(SchedulesTabEnum tab) {
    tabEnumSchedule = tab;
    update();
  }
  @override
  void dispose() {
     super.dispose();
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
