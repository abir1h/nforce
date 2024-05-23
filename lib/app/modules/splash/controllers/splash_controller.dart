import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/app/utils/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), navigateToDestination);
    super.onInit();
  }

  void navigateToDestination() {
    final token = SharedPreferenceService.getToken();
    if (token != null && token.isNotEmpty) {
      Get.offAllNamed<void>(Routes.BOTTOM_NAV_BAR);
    } else {
      Get.offAllNamed<void>(Routes.ON_BOARDING);
    }
    notificationPermission();
  }

  Future<void> notificationPermission() async {
    await FirebaseMessaging.instance.requestPermission();
  }
}
