import 'package:get/get.dart';
import 'package:nuforce/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () {
      navigateToDestination();
    });
    super.onInit();
  }

  void navigateToDestination() {
    Get.offAllNamed(Routes.ON_BOARDING);
  }
}
