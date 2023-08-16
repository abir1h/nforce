import 'package:get/get.dart';
import 'dart:developer' as developer show log;

class OnBoardingController extends GetxController {
  RxInt currentPageIndex = 0.obs;
  RxDouble percent = (1 / 3).obs;
  RxBool isLastPage = false.obs;

  void changePage() {
    if (currentPageIndex.value == 2) {
      isLastPage.value = true;
      return;
    }
    final index = currentPageIndex.value + 1;
    currentPageIndex.value = index;
    percent.value = (index + 1) / 3;
    isLastPage.value = index == 2;
  }
}
