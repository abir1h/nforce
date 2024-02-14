// ignore_for_file: omit_local_variable_types

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/services/forgot_password_api_services.dart';

class ForgotPasswordController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void _toggleLoading() {
    _isLoading = !_isLoading;
    update();
  }

  Future<Either<String, String>> sendPasswordResetLink({
    required String email,
  }) async {
    _toggleLoading();
    bool isSuccessful = false;
    String message = '';
    await ForgotPasswordApiServices.sendPasswordResetLink(email: email).then((value) {
      value.fold(
        (l) {
          isSuccessful = true;
          message = l;
        },
        (r) {
          isSuccessful = false;
          message = r;
        },
      );
    });
    _toggleLoading();
    return isSuccessful ? left(message) : right(message);
  }
}
