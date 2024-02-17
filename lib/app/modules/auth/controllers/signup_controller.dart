// ignore_for_file: omit_local_variable_types

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/services/signup_api_services.dart';

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
      countryCode: 'US', // TODO Make it dynamic
      name: name,
      email: email,
      password: password,
      agreedToTnc: _agreeToTerms,
    ).then((res) {
      res.fold(
        (success) {
          isSuccessful = true;
          message = success;
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
