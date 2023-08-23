import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/components/signup_page.dart';
import 'package:nuforce/app/modules/auth/components/singin_page.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar.dart';
import 'package:nuforce/app/shared/widgets/custom_tabbar.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

import '../controllers/auth_controller.dart';

class LoginSignupView extends GetView<AuthController> {
  const LoginSignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbar(
        title: '',
      ),
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => CustomTabBar(
                          isSelected: controller.tabIndex.value == 0,
                          onTap: () {
                            controller.tabIndex.value = 0;
                          },
                          text: 'Sing In',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () => CustomTabBar(
                          isSelected: controller.tabIndex.value == 1,
                          onTap: () {
                            controller.tabIndex.value = 1;
                          },
                          text: 'Sing Up',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                  child: Obx(
                    () => controller.tabIndex.value == 0
                        ? SizedBox(
                            height: height - 50 - AppBar().preferredSize.height - 60,
                            child: SignInPage(controller: controller),
                          )
                        : SizedBox(
                            height: height - 50 - AppBar().preferredSize.height - 60,
                            child: SignUpPage(controller: controller),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
