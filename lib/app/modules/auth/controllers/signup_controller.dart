import 'package:get/get.dart';

class SingupAuthController extends GetxController {
  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;

  RxBool agreeToTerms = true.obs;
  RxBool sendPromotionalEmails = true.obs;
}
