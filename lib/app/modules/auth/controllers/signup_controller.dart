import 'package:get/get.dart';

class SingupAuthController extends GetxController {
  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;

  RxBool agreeToTerms = true.obs;
  RxBool sendPromotionalEmails = true.obs;

  RxString selectedIndustry = 'Select Industry Type'.obs;
  List<String> industryType = [
    'Test Industry 1',
    'Test Industry 2',
    'Test Industry 3',
  ];
}
