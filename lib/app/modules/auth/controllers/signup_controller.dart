// ignore_for_file: omit_local_variable_types

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/controllers/auth_controller.dart';
import 'package:nuforce/app/modules/auth/services/signup_api_services.dart';
import 'package:nuforce/app/modules/auth/views/otp_view.dart';
import 'package:nuforce/app/utils/shared_preferences.dart';

class SingupAuthController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void toggleLoading() {
    _isLoading = !_isLoading;
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
    toggleLoading();

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
    toggleLoading();
    return isSuccessful ? Left(message) : Right(message);
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
