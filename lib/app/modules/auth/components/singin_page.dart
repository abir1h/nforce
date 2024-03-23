import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/components/social_login_buttons.dart';
import 'package:nuforce/app/modules/auth/controllers/auth_controller.dart';
import 'package:nuforce/app/modules/auth/views/forgot_password_view.dart';
import 'package:nuforce/app/modules/auth/views/magic_link_signin_view.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/or_x_with.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    super.key,
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // final controller = Get.put(AuthController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  GlobalKey<FormState> businessLoginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return IgnorePointer(
          ignoring: controller.isLoading,
          child: Form(
            key: businessLoginFormKey,
            child: Column(
              children: [
                Column(
                  children: [
                    CustomTextField(
                      controller: emailController,
                      hint: 'Enter your email',
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: passwordController,
                      hint: 'Enter your password',
                      label: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.isPasswordVisible,
                      isVisibile: controller.isPasswordVisible,
                      isPassword: true,
                      onVisibilityTap: () {
                        controller.togglePasswordVisibility();
                      },
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (v.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: controller.rememberMe,
                              onChanged: (value) {
                                controller.toggleRememberMe();
                              },
                              activeColor: AppColors.primaryBlue1,
                              checkColor: AppColors.white1,
                              side: const BorderSide(
                                color: AppColors.primaryBlue1,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                'Remember me\n(90 days)',
                                style: TextStyle(
                                  color: AppColors.nutralBlack1,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.to<void>(() => const ForgotPasswordView());
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: AppColors.nutralBlack1,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    if (controller.isLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      PrimaryButton(
                        onPressed: () {
                          if (!businessLoginFormKey.currentState!.validate()) {
                            return;
                          }
                          controller.businessLogin(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        },
                        text: 'Sign In',
                      ),
                    const SizedBox(height: 15),
                    PrimaryButton(
                      onPressed: () {
                        Get.to<void>(() => const MagicLinkSingin());
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
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: AppColors.nutralBlack1,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        controller.changeTabIndex(1);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: AppColors.primaryBlue1,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
