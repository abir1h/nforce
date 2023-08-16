import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/on_boarding/components/next_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/main.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      'Skip',
                      style: CustomTextStyle.heading4.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyText,
                      ),
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
          ),
        ),
      ),
    );
  }
}
