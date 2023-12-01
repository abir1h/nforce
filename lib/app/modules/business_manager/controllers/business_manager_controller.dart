import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/views/user_roles/user_roles_controller.dart';

class BusinessManagerController extends GetxController {
  RxString selectedValue = '7 days'.obs;
  final userRolesController = Get.put(UserRolesController());

  @override
  void dispose() {
    userRolesController.dispose();
    super.dispose();
  }
}
