import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/calender_setting_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/cash_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/check_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/custom_field_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/customer_contact_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/direct_debit_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/estimation_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/regional_settings_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/service_category_edit_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/service_region_edit_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/service_terms_edit_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/service_topic_edit_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/business_manager_calendar_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/business_manager_commission_tiers_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/contact_group/business_manager_contact_group_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/business_manager_label_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_service_category_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_service_region_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_service_topic_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_terms_and_policy_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/user_roles/controllers/user_role_controller.dart';

class BusinessManagerController extends GetxController {
  RxString selectedValue = '7 days'.obs;
  final userRolesController = Get.put(UserRoleController());
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
  final serviceCatalogsController = Get.put(BusinessManagerServiceCategoryController());
  final serviceTopicController = Get.put(BusinessManagerServiceTopicController());
  final serviceRegionController = Get.put(BusinessManagerServiceRegionController());
  final termsAndPolicyController = Get.put(BusinessManagerTermsAndPolicyController());
  final serviceCategoryController = Get.put(ServiceCategoryEditController());
  final serviceTopicEditController = Get.put(ServiceTopicEditController());
  final serviceRegionEditController = Get.put(ServiceRegionEditController());
  final serviceTermsEditController = Get.put(ServiceTermsEditController());

  @override
  void dispose() {
    userRolesController.dispose();
    super.dispose();
  }
}
