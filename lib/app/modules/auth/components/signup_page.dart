import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/components/verify_email_bottom_sheet.dart';
import 'package:nuforce/app/modules/auth/controllers/auth_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const CustomTextField(
                controller: null,
                label: 'First Name',
                hint: 'Enter your first name',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                controller: null,
                label: 'Last Name',
                hint: 'Enter your last name',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                controller: null,
                label: 'Email',
                hint: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              Obx(
                () => CustomTextField(
                  controller: null,
                  hint: 'Enter your password',
                  label: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.signUpController.isPasswordVisible.value,
                  isVisibile: controller.signUpController.isPasswordVisible.value,
                  isPassword: true,
                  onVisibilityTap: controller.togglePasswordVisibility,
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => CustomTextField(
                  controller: null,
                  hint: 'Re-enter your password',
                  label: 'Confirm Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: controller.signUpController.isConfirmPasswordVisible.value,
                  isVisibile: controller.signUpController.isConfirmPasswordVisible.value,
                  isPassword: true,
                  onVisibilityTap: controller.toggleResetPasswordVisibility,
                ),
              ),
              const SizedBox(height: 16),
              TermsAndCondition(controller: controller),
              const SizedBox(height: 16),
              PromotionalOfferEmail(controller: controller),
              const SizedBox(height: 30),
              PrimaryButton(
                onPressed: () {
                  varifyEmailBottomSheet(context);
                },
                text: 'Sing Up',
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account? ',
                    style: CustomTextStyle.heading4.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.white4,
                    ),
                  ),
                  GestureDetector(
                    onTap: Get.back<void>,
                    child: Text(
                      'Sign in',
                      style: CustomTextStyle.heading4.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryBlue1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({
    required this.controller,
    super.key,
  });

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Checkbox(
            value: controller.signUpController.agreeToTerms.value,
            onChanged: (newV) {
              controller.signUpController.agreeToTerms.value = newV!;
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            width: width * 0.7,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Yes. I am agree with NuForce’s ',
                    style: CustomTextStyle.paragraphSmall.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.subText,
                    ),
                  ),
                  TextSpan(
                    text: 'Terms & Conditions',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // navigate to desired screen
                      },
                    style: CustomTextStyle.paragraphSmall.copyWith(
                      color: AppColors.primaryBlue1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PromotionalOfferEmail extends StatelessWidget {
  const PromotionalOfferEmail({
    required this.controller,
    super.key,
  });

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Checkbox(
            value: controller.signUpController.sendPromotionalEmails.value,
            onChanged: (newV) {
              controller.signUpController.sendPromotionalEmails.value = newV!;
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            width: width * 0.7,
            child: Text(
              'Send me promotional offers and news from service providers',
              style: CustomTextStyle.paragraphSmall.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.subText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
