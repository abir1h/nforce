import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/controllers/forgot_password_controller.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/or_x_with.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/main.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  bool ignorePointer = false;
  bool emailError = true;
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Get.put(ForgotPasswordController());
    emailController.addListener(() {
      if (GetUtils.isEmail(emailController.text)) {
        setState(() {
          emailError = false;
        });
      } else {
        setState(() {
          emailError = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: '',
      ),
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
            child: IgnorePointer(
              ignoring: ignorePointer,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Forget Password',
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.heading1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.nutralBlack1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Enter your email address and we will send you code',
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.heading4.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.subText,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: emailController,
                    hint: 'Enter your email',
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 30),
                  GetBuilder<ForgotPasswordController>(
                    builder: (controller) {
                      if (controller.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return IgnorePointer(
                          ignoring: emailError,
                          child: PrimaryButton(
                            primaryColored: !emailError,
                            onPressed: () async {
                              // Get.to<void>(() => const OtpView());
                              setState(() {
                                ignorePointer = true;
                              });
                              await controller.sendPasswordResetLink(email: emailController.text).then((value) {
                                value.fold(
                                  (l) {
                                    showAdaptiveDialog<void>(
                                      context: context,
                                      builder: (ctx) {
                                        return AlertDialog(
                                          title: const Text('Success'),
                                          content: Text(l),
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
                                  (r) {
                                    showAdaptiveDialog<void>(
                                      context: context,
                                      builder: (ctx) {
                                        return AlertDialog(
                                          title: const Text('Error'),
                                          content: Text(r),
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
                            text: 'Send verification code',
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Can’t reset your password?',
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.heading4.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.subText,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const OrXWith(label: 'Or'),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: Get.back<void>,
                    child: Text(
                      'Create new account',
                      style: CustomTextStyle.heading4.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryBlue1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
