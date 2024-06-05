// ignore_for_file: omit_local_variable_types
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/controllers/auth_controller.dart';
import 'package:nuforce/app/modules/auth/services/account_status_api_services.dart';
import 'package:nuforce/app/modules/auth/services/otp_services.dart';
import 'package:nuforce/app/modules/auth/services/signup_api_services.dart';
import 'package:nuforce/app/modules/auth/views/account_setup_view.dart';
import 'package:nuforce/app/modules/auth/views/otp_view.dart';
import 'package:nuforce/app/modules/auth/views/reset_password_view.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/app/utils/app_constants.dart';
import 'package:nuforce/app/utils/shared_preferences.dart';

class SingupAuthController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    update();
  }

  bool _isPasswordVisible = true;
  bool get getIsPasswordVisible => _isPasswordVisible;
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    update();
  }

  bool _isConfirmPasswordVisible = true;
  bool get getIsConfirmPasswordVisible => _isConfirmPasswordVisible;
  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    update();
  }

  bool _agreeToTerms = true;
  bool get agreeToTerms => _agreeToTerms;
  void toggleAgreeToTerms() {
    _agreeToTerms = !_agreeToTerms;
    update();
  }

  bool _sendPromotionalEmails = true;
  bool get getSendPromotionalEmails => _sendPromotionalEmails;
  void toggleSendPromotionalEmails() {
    _sendPromotionalEmails = !_sendPromotionalEmails;
    update();
  }

  String _countryCode = 'US';
  String get countryCode => _countryCode;
  set countryCode(String code) {
    _countryCode = code;
    update();
  }

  RegistrationSuccess? _registrationData;
  RegistrationSuccess? get registrationData => _registrationData;
  set registrationData(RegistrationSuccess? unique) {
    _registrationData = unique;
    update();
  }

  String? _email;
  String? get email => _email;
  set email(String? email) {
    _email = email;
    update();
  }

  int? _userId;
  int? get userId => _userId;
  set userId(int? id) {
    _userId = id;
    update();
  }

  Future<Either<String, String>> onSignup({
    required String name,
    required String email,
    required String password,
  }) async {
    isLoading = true;

    bool isSuccessful = false;
    String message = '';

    await SignupService.signup(
      userType: UserTypes.provider,
      countryCode: countryCode,
      name: name,
      email: email,
      password: password,
      agreedToTnc: _agreeToTerms,
    ).then((res) {
      this.email = email;
      res.fold(
        (success) async {
          isSuccessful = true;
          registrationData = success;
          message = 'Registration successful';
          userId = success.userId;
          SharedPreferenceService.setUserId(success.userId);
          Get.find<AuthController>().changeFromSignUp(true);
          Get.to(() => const OtpView());
        },
        (error) {
          isSuccessful = false;
          message = error;
        },
      );
    });
    isLoading = false;
    return isSuccessful ? Left(message) : Right(message);
  }

  void navigateFromOtpView(bool hasBusiness) {
    final authController = Get.find<AuthController>();
    if (authController.fromSetupAccount) {
      Get.back<void>();
      return;
    }
    if (authController.fromSignUp) {
      if (hasBusiness) {
        Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
      } else {
        Get.offAll(() => const AccountSetupView());
      }
    } else {
      Get.to<void>(() => const ResetPasswordView());
    }
  }

  Future<void> verifyOtp({required String otp}) async {
    isLoading = true;
    if (registrationData == null) {
      Fluttertoast.showToast(msg: AppConstants.unknownError);
      return;
    }

    await OtpServices.verifyOtp(
      uniqueId: registrationData?.uniqueId ?? '',
      email: email!,
      otp: otp,
    ).then((value) {
      value.fold(
        (success) {
          checkAccount();
        },
        (error) {
          Fluttertoast.showToast(msg: error);
        },
      );
    });
    isLoading = false;
  }

  Future<void> resendOtp() async {
    if (registrationData?.userId == null) {
      Fluttertoast.showToast(msg: AppConstants.unknownError);
      return;
    }
    await OtpServices.resendOtp(
      userId: registrationData!.userId,
    ).then((value) {
      if (value) {
        Fluttertoast.showToast(msg: 'OTP sent successfully');
      } else {
        Fluttertoast.showToast(msg: 'Failed to send OTP');
      }
    });
  }

  Future<void> checkAccount() async {
    final uniqueId = SharedPreferenceService.getUniqueId();
    if (uniqueId == null) {
      Fluttertoast.showToast(msg: AppConstants.unknownError);
      log('Unique ID is null', name: 'checkAccount');
      return;
    }
    await AccountStatusApiServices.getAccountStatus(uniqueId: uniqueId).then(
      (value) {
        value.fold(
          (success) {
            navigateFromOtpView(success.data?.businessId != null);
          },
          (error) {
            Fluttertoast.showToast(msg: error);
          },
        );
      },
    );
  }

  String selectedIndustry = 'Select Industry Type';
  List<String> industryType = [
    'Test Industry 1',
    'Test Industry 2',
    'Test Industry 3',
  ];

  String selectedCountry = 'Select Country';
  List<String> country = [
    'Country 1',
    'Country 2',
    'Country 3',
  ];

  String selectedState = 'Select State';
  List<String> state = [
    'State 1',
    'State 2',
    'State 3',
  ];
}
