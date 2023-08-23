import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/controllers/signup_controller.dart';

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
}
