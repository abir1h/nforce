import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/calendar/controllers/calendar_controller.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/dashboard/controllers/dashboard_controller.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/estimation/controllers/estimation_controller.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/service_center_maps/controllers/service_center_maps_controller.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/work_order/controllers/work_order_controller.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/work_order_search/controllers/work_order_search_controller.dart';

class ServiceCenterController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    Get.put(DashboardController());
    Get.put(WorkOrderController());
    Get.put(WorkOrderSearchController());
    Get.put(EstimationController());
    Get.put(ServiceCenterCalendarController());
    Get.put(ServiceCenterMapsController());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
