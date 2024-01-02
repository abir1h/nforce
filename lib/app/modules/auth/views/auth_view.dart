import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/components/social_login_buttons.dart';
import 'package:nuforce/app/modules/auth/controllers/auth_controller.dart';
import 'package:nuforce/app/modules/auth/views/agent_customer_login_view.dart';
import 'package:nuforce/app/modules/auth/views/login_singup_view.dart';
import 'package:nuforce/app/shared/widgets/or_x_with.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
                const SizedBox(height: 40),
                SvgPicture.asset(Assets.images.svg.nuforceLogo),
                const SizedBox(height: 30),
                Text(
                  'Welcome to NuForce',
                  style: CustomTextStyle.heading1.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.nutralBlack1,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Get started on your journey to effortless service management.',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.heading4.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.subText,
                  ),
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  text: 'Try NuForce For Free',
                  onPressed: () {
                    if (AuthController().initialized) {
                      Get.to<void>(() => const LoginSignupView());
                    } else {
                      Get
                        ..put(AuthController())
                        ..to<void>(() => const LoginSignupView());
                    }
                  },
                ),
                const SizedBox(height: 15),
                PrimaryButton(
                  text: 'Log in to your Business',
                  onPressed: () {
                    // Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
                    Get.to<void>(() => const LoginSignupView());
                  },
                  primaryColored: false,
                ),
                const SizedBox(height: 30),
                const OrXWith(label: 'Or log in with'),
                const SizedBox(height: 30),
                const SocialLoginButtons(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login as an ',
                      style: CustomTextStyle.heading4.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyText,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (AuthController().initialized) {
                          Get.to<void>(() => const AgentCustomerLoginView());
                        } else {
                          Get
                            ..put(AuthController())
                            ..to<void>(() => const AgentCustomerLoginView());
                        }
                      },
                      child: Text(
                        'Agent ',
                        style: CustomTextStyle.heading4.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryBlue1,
                        ),
                      ),
                    ),
                    Text(
                      'or ',
                      style: CustomTextStyle.heading4.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyText,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (AuthController().initialized) {
                          Get.to<void>(() => const AgentCustomerLoginView());
                        } else {
                          Get
                            ..put(AuthController())
                            ..to<void>(() => const AgentCustomerLoginView());
                        }
                      },
                      child: Text(
                        'Customer',
                        style: CustomTextStyle.heading4.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryBlue1,
                        ),
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
