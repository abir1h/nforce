import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/on_boarding/components/next_button.dart';
import 'package:nuforce/app/modules/on_boarding/components/skip_button.dart';
import 'package:nuforce/app/modules/on_boarding/controllers/on_boarding_controller.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/main.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: height,
          width: isIpad ? 0.8.sw : 1.sw,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () => controller.contents[controller.currentPageIndex.value],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          SkipButton(
                            onTap: () {
                              Get.offAllNamed<void>(Routes.AUTH);
                            },
                          ),
                          const Spacer(),
                          Obx(
                            () => NextButton(
                              percent: controller.percent.value,
                              text: controller.isLastPage.value ? 'Start' : 'Next',
                              onTap: () {
                                controller.changePage();
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
