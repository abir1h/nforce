import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/calender_setting_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/estimation_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/regional_settings_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/business_manager_calendar_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/contact_group/business_manager_contact_group_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/business_manager_label_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/user_roles/user_roles_controller.dart';

class BusinessManagerController extends GetxController {
  RxString selectedValue = '7 days'.obs;
  final userRolesController = Get.put(UserRolesController());
  final businessManagerCalendarController = Get.put(BusinessManagerCalendarController());
  final regionalSettingController = Get.put(RegionalSettingController());
  final calendarSettingController = Get.put(CalenderSettingController());
  final estimationSettingController = Get.put(EstimationSettingController());
  final labelController = Get.put(BusinessManagerLabelController());
  final contactGroupController = Get.put(BusinessManagerContactGroupController());

  @override
  void dispose() {
    userRolesController.dispose();
    super.dispose();
  }
}
