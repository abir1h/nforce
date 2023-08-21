import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxInt tabIndex = 0.obs;
  RxBool isPasswordVisible = true.obs;
  RxBool rememberMe = false.obs;
  TextEditingController magicLinkEmailController = TextEditingController();
  final pinController = TextEditingController();
  final focusNode = FocusNode();

}
