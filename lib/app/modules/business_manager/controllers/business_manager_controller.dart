import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/calender_setting_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/regional_settings_controller.dart';
import 'package:nuforce/app/modules/business_manager/views/calendar/business_manager_calendar_controller.dart';
import 'package:nuforce/app/modules/business_manager/views/user_roles/user_roles_controller.dart';

class BusinessManagerController extends GetxController {
  RxString selectedValue = '7 days'.obs;
  final userRolesController = Get.put(UserRolesController());
  final businessManagerCalendarController = Get.put(BusinessManagerCalendarController());
  final regionalSettingController = Get.put(RegionalSettingController());
  final calendarSettingController = Get.put(CalenderSettingController());


  @override
  void dispose() {
    userRolesController.dispose();
    super.dispose();
  }
}
