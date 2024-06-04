// ignore_for_file: avoid_positional_boolean_parameters

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/controllers/agent_customer_auth_controller.dart';
import 'package:nuforce/app/modules/auth/controllers/signup_controller.dart';
import 'package:nuforce/app/modules/auth/services/login_api_services.dart';
import 'package:nuforce/app/modules/auth/services/otp_services.dart';
import 'package:nuforce/app/modules/auth/views/account_setup_view.dart';
import 'package:nuforce/app/modules/auth/views/reset_password_view.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/app/utils/api_client.dart';
import 'package:nuforce/app/utils/app_constants.dart';
import 'package:nuforce/app/utils/shared_preferences.dart';

class AuthController extends GetxController {
  final signUpController = Get.put(SingupAuthController());
  final agentCustomerAuthController = Get.put(AgentCustomerAuthController());
  int tabIndex = 0;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  bool isPasswordVisible = true;
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  bool isResetPasswordVisible = true;
  void toggleResetPasswordVisibility() {
    isResetPasswordVisible = !isResetPasswordVisible;
    update();
  }

  bool isConfirmPasswordVisible = true;
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    update();
  }

  bool rememberMe = true;
  void toggleRememberMe() {
    rememberMe = !rememberMe;
    update();
  }

  TextEditingController magicLinkEmailController = TextEditingController();
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  bool fromSignUp = false;
  void changeFromSignUp(bool value) {
    fromSignUp = value;
    update();
  }

  bool fromSetupAccount = false;
  void changeFromSetupAccount(bool value) {
    fromSetupAccount = value;
    update();
  }

  void navigateFromOtpView() {
    if (fromSetupAccount) {
      Get.back<void>();
      return;
    }
    if (fromSignUp) {
      Get.offAll(() => const AccountSetupView());
      // Get.offAllNamed(
      //   Routes.BOTTOM_NAV_BAR,
      //   arguments: {'navigateTo': 'profile'},
      // );
    } else {
      Get.to<void>(() => const ResetPasswordView());
    }
  }

  Future<void> verifyOtp() async {
    isLoading = true;
    if (signUpController.registrationData == null) {
      Fluttertoast.showToast(msg: AppConstants.unknownError);
      return;
    }

    await OtpServices.verifyOtp(
      uniqueId: signUpController.registrationData?.uniqueId ?? '',
      email: signUpController.email!,
      otp: pinController.text,
    ).then((value) {
      if (value) {
        navigateFromOtpView();
      } else {
        // Fluttertoast.showToast(msg: 'Invalid OTP');
        log('OTP verification failed');
      }
    });
    isLoading = false;
  }

  Future<void> resendOtp() async {
    if (signUpController.registrationData?.userId == null) {
      Fluttertoast.showToast(msg: AppConstants.unknownError);
      return;
    }
    await OtpServices.resendOtp(
      userId: signUpController.registrationData!.userId,
    ).then((value) {
      if (value) {
        Fluttertoast.showToast(msg: 'OTP sent successfully');
      } else {
        Fluttertoast.showToast(msg: 'Failed to send OTP');
      }
    });
  }

  Future<void> businessLogin({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    isLoading = true;
    await LoginService.businessLogin(email: email, password: password).then((value) {
      value.fold(
        (success) async {
          if (success.data?.accessToken != null && success.data!.accessToken != '' && success.data?.id != null) {
            SharedPreferenceService.setToken(success.data!.accessToken!);
            SharedPreferenceService.setUserId(success.data!.id!);
            await ApiClient.init();
            if (!rememberMe) {
              SharedPreferenceService.setToken('');
            }
            await Get.offAllNamed<void>(Routes.BOTTOM_NAV_BAR);
          }
        },
        (error) {
          showDialog<void>(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Login Error'),
              content: Text(error),
              actions: [
                TextButton(
                  onPressed: Get.back<void>,
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
      );
    });
    isLoading = false;
  }
}
