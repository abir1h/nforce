import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/controllers/signup_controller.dart';
import 'package:nuforce/app/routes/app_pages.dart';
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
  final formKey = GlobalKey<FormState>();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    fNameController.dispose();
    lNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool ignorePointer = false;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignorePointer,
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                controller: fNameController,
                label: 'First Name',
                hint: 'Enter your first name',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'First name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: lNameController,
                label: 'Last Name',
                hint: 'Enter your last name',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: emailController,
                label: 'Email',
                hint: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'Invalid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              GetBuilder<SingupAuthController>(
                builder: (controller) {
                  return CustomTextField(
                    controller: passwordController,
                    hint: 'Enter your password',
                    label: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: controller.getIsPasswordVisible,
                    isVisibile: controller.getIsPasswordVisible,
                    isPassword: true,
                    onVisibilityTap: controller.togglePasswordVisibility,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              GetBuilder<SingupAuthController>(
                builder: (controller) {
                  return CustomTextField(
                    controller: confirmPasswordController,
                    hint: 'Re-enter your password',
                    label: 'Confirm Password',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: controller.getIsConfirmPasswordVisible,
                    isVisibile: controller.getIsConfirmPasswordVisible,
                    isPassword: true,
                    onVisibilityTap: controller.toggleConfirmPasswordVisibility,
                    validator: (value) {
                      if (value != passwordController.text) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              const TermsAndCondition(),
              const SizedBox(height: 16),
              const PromotionalOfferEmail(),
              const SizedBox(height: 30),
              GetBuilder<SingupAuthController>(
                builder: (controller) {
                  if (controller.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return IgnorePointer(
                      ignoring: !controller.agreeToTerms,
                      child: PrimaryButton(
                        primaryColored: controller.agreeToTerms,
                        onPressed: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (!formKey.currentState!.validate()) {
                            return;
                          }

                          // varifyEmailBottomSheet(context);
                          setState(() {
                            ignorePointer = true;
                          });
                          await controller
                              .onSignup(
                            name: '${fNameController.text} ${lNameController.text}',
                            email: emailController.text,
                            password: passwordController.text,
                          )
                              .then((value) {
                            value.fold(
                              (success) {
                                showAdaptiveDialog<void>(
                                  context: context,
                                  builder: (ctx) {
                                    return AlertDialog(
                                      title: const Text('Success'),
                                      content: Text(success),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Get.offAllNamed<void>(Routes.AUTH);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              (error) {
                                showAdaptiveDialog<void>(
                                  context: context,
                                  builder: (ctx) {
                                    return AlertDialog(
                                      title: const Text('Error'),
                                      content: Text(error),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back<void>();
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          });
                          setState(() {
                            ignorePointer = false;
                          });
                        },
                        text: 'Sign Up',
                      ),
                    );
                  }
                },
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
        ),
      ),
    );
  }
}

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingupAuthController>(
      builder: (controller) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              value: controller.agreeToTerms,
              onChanged: (newV) {
                // controller.signUpController.agreeToTerms = newV!;
                controller.toggleAgreeToTerms();
              },
            ),
            const SizedBox(width: 8),
            Expanded(
              child: SizedBox(
                width: width * 0.7,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Yes. I agree with NuForce’s ',
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
      },
    );
  }
}

class PromotionalOfferEmail extends StatelessWidget {
  const PromotionalOfferEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GetBuilder<SingupAuthController>(
          builder: (controller) {
            return Checkbox(
              value: controller.getSendPromotionalEmails,
              onChanged: (newV) {
                // controller.signUpController.sendPromotionalEmails = newV!;
                controller.toggleSendPromotionalEmails();
              },
            );
          },
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
