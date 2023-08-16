import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/on_boarding/components/top_view_with_text.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/gen/assets.gen.dart';

class OnBoardingController extends GetxController {
  RxInt currentPageIndex = 0.obs;
  RxDouble percent = (1 / 3).obs;
  RxBool isLastPage = false.obs;

  void changePage() {
    if (isLastPage.value) {
      Get.offAllNamed(Routes.HOME);
      return;
    }
    if (currentPageIndex.value == 2) {
      isLastPage.value = true;
      return;
    }
    final index = currentPageIndex.value + 1;
    currentPageIndex.value = index;
    percent.value = (index + 1) / 3;
    isLastPage.value = index == 2;
  }

  RxList<Widget> contents = [
    TopViewWithText(
      imagePath: Assets.images.png.onboarding1.path,
      title: 'One app to rule them all',
      description: 'With our app, you can easily track and man age all your solution service requests in one place.',
    ),
    TopViewWithText(
      imagePath: Assets.images.png.onboarding2.path,
      title: 'Effortless Service Tracking',
      description: 'With our app, you can easily track and man age all your solution service requests in one place.',
    ),
    TopViewWithText(
      imagePath: Assets.images.png.onboarding3.path,
      title: 'Field Ops Made Simple',
      description: 'With our app, you can easily track and man age all your solution service requests in one place.',
    ),
  ].obs;
}
