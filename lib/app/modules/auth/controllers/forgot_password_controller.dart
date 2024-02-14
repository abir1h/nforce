import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void toggleLoading() {
    _isLoading = !_isLoading;
    update();
  }
}
