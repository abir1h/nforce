import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/customer_contact_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/business_manager_commission_tiers_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/custom_field_controller.dart';
import 'calender_setting_controller.dart';
import 'cash_controller.dart';
import 'check_controller.dart';
import 'direct_debit_controller.dart';
import 'estimation_controller.dart';
import 'regional_settings_controller.dart';
import '../sub_modules/calendar/business_manager_calendar_controller.dart';
import '../sub_modules/contact_group/business_manager_contact_group_controller.dart';
import '../sub_modules/label/business_manager_label_controller.dart';
import '../sub_modules/user_roles/user_roles_controller.dart';

class BusinessManagerController extends GetxController {
  RxString selectedValue = '7 days'.obs;
  final userRolesController = Get.put(UserRolesController());
  final businessManagerCalendarController = Get.put(BusinessManagerCalendarController());
  final regionalSettingController = Get.put(RegionalSettingController());
  final calendarSettingController = Get.put(CalenderSettingController());
  final estimationSettingController = Get.put(EstimationSettingController());
  final labelController = Get.put(BusinessManagerLabelController());
  final contactGroupController = Get.put(BusinessManagerContactGroupController());
  final cashController = Get.put(CashController());
  final checkController = Get.put(CheckController());
  final directDebitController = Get.put(DirectDebitController());
  final commissionTierController = Get.put(BusinessManagerCommissionTiersController());
  final customFieldController = Get.put(CustomFieldController());
  final customerContactController = Get.put(CustomerContactController());

  @override
  void dispose() {
    userRolesController.dispose();
    super.dispose();
  }
}
