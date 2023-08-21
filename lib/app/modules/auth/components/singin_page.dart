import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/components/social_login_buttons.dart';
import 'package:nuforce/app/modules/auth/controllers/auth_controller.dart';
import 'package:nuforce/app/modules/auth/views/forgot_password_view.dart';
import 'package:nuforce/app/modules/auth/views/magic_link_signin_view.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/or_x_with.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    super.key,
    required this.controller,
  });

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const CustomTextField(
              controller: null,
              hint: 'Enter your email',
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            Obx(
              () => CustomTextField(
                controller: null,
                hint: '********',
                label: 'Password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: controller.isPasswordVisible.value,
                isVisibile: controller.isPasswordVisible.value,
                isPassword: true,
                onVisibilityTap: () {
                  controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          controller.rememberMe.value = !controller.rememberMe.value;
                        },
                        activeColor: AppColors.primaryBlue1,
                        checkColor: AppColors.white1,
                        side: const BorderSide(
                          color: AppColors.primaryBlue1,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Remember me\n(90 days)',
                      style: TextStyle(
                        color: AppColors.nutralBlack1,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const ForgotPasswordView());
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            PrimaryButton(onPressed: () {}, text: 'Sing In'),
            const SizedBox(height: 15),
            PrimaryButton(
              onPressed: () {
                Get.to(() => const MagicLinkSingin());
              },
              text: 'Sign in with magic link',
              primaryColored: false,
            ),
            const SizedBox(height: 30),
            const OrXWith(label: 'Or log in with'),
            const SizedBox(height: 30),
            const SocialLoginButtons(),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don’t have a account?',
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: AppColors.primaryBlue1,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
