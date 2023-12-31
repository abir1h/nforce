import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/components/reset_pass_bottosheet.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/main.dart';

import '../controllers/auth_controller.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: '',
      ),
      body: SafeArea(
        child: GetBuilder<AuthController>(
          builder: (_) {
            return SizedBox(
              height: height,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Set Up New Password',
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.heading1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Reset your password to recovery and log in your account',
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.heading4.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.subText,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      controller: null,
                      hint: '********',
                      label: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isResetPasswordVisible,
                      isVisibile: controller.isResetPasswordVisible,
                      isPassword: true,
                      onVisibilityTap: () {
                        controller.toggleResetPasswordVisibility();
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      controller: null,
                      hint: '********',
                      label: 'Confirm Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isConfirmPasswordVisible,
                      isVisibile: controller.isConfirmPasswordVisible,
                      isPassword: true,
                      onVisibilityTap: () {
                        controller.toggleConfirmPasswordVisibility();
                      },
                    ),
                    const SizedBox(height: 30),
                    PrimaryButton(
                      onPressed: () {
                        resetPasswordBottomSheet(context);
                      },
                      text: 'Save Password',
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
