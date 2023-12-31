import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/components/signup_page.dart';
import 'package:nuforce/app/modules/auth/components/singin_page.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_tabbar.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

import '../controllers/auth_controller.dart';

class LoginSignupView extends StatefulWidget {
  const LoginSignupView({Key? key}) : super(key: key);

  @override
  State<LoginSignupView> createState() => _LoginSignupViewState();
}

class _LoginSignupViewState extends State<LoginSignupView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white1,
          appBar: const CustomAppbarMinimal(
            title: '',
          ),
          body: KeyboardDismissOnTap(
            dismissOnCapturedTaps: true,
            child: SafeArea(
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
                            child: CustomTabBar(
                              isSelected: controller.tabIndex == 0,
                              onTap: () {
                                controller.changeTabIndex(0);
                              },
                              text: 'Sing In',
                            ),
                          ),
                          Expanded(
                            child: CustomTabBar(
                              isSelected: controller.tabIndex == 1,
                              onTap: () {
                                controller.changeTabIndex(1);
                              },
                              text: 'Sing Up',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                        child: controller.tabIndex == 0
                            ? SizedBox(
                                height: height - 50 - AppBar().preferredSize.height - 60,
                                child: const SignInPage(),
                              )
                            : SizedBox(
                                height: height - 50 - AppBar().preferredSize.height - 60,
                                child: const SignUpPage(),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
