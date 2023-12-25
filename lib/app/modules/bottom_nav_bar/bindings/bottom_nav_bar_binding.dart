import 'package:get/get.dart';
import 'package:nuforce/app/modules/activity/controllers/activity_controller.dart';
import 'package:nuforce/app/modules/home/controllers/home_controller.dart';
import 'package:nuforce/app/modules/new_orders/controllers/new_orders_controller.dart';
import 'package:nuforce/app/modules/settings/controllers/settings_controller.dart';
import 'package:nuforce/app/modules/today/controllers/today_controller.dart';

import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBarController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(TodayController(), permanent: true);
    Get.put(NewOrdersController(), permanent: true);
    Get.put(ActivityController(), permanent: true);
    Get.put(SettingsController(), permanent: true);
  }
}
