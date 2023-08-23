import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/controllers/signup_controller.dart';
import 'package:nuforce/app/modules/auth/views/account_setup_view.dart';
import 'package:nuforce/app/modules/auth/views/reset_password_view.dart';

class AuthController extends GetxController {
  final signUpController = Get.put(SingupAuthController());
  RxInt tabIndex = 0.obs;

  RxBool isPasswordVisible = true.obs;
  RxBool isResetPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;

  RxBool rememberMe = false.obs;
  TextEditingController magicLinkEmailController = TextEditingController();
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  RxBool fromSignUp = false.obs;
  RxBool fromSetupAccount = false.obs;

  void navigateFromOtpView() {
    if (fromSetupAccount.value) {
      Get.back();
      return;
    }
    if (fromSignUp.value) {
      Get.to(() => const AccountSetupView());
    } else {
      Get.to(() => const ResetPasswordView());
    }
  }
}
