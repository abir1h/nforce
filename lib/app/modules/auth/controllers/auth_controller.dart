import 'package:get/get.dart';

class AuthController extends GetxController {
  RxInt tabIndex = 0.obs;
  RxBool isPasswordVisible = true.obs;
  RxBool rememberMe = false.obs;
}
