import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/components/magic_link_bottomsheet.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

import '../controllers/auth_controller.dart';

class TryingToLoginView extends GetView<AuthController> {
  const TryingToLoginView({Key? key}) : super(key: key);
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: width * 0.7,
                  child: Image.asset(
                    Assets.images.png.timeExceeded.path,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'Please wait...',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.heading1.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.nutralBlack1,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'We are trying to login you in',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.heading4.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.subText,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'it seems this link has been expired',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.heading5.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.red,
                  ),
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  onPressed: () {
                    magicLinkBottomSheet(context);
                  },
                  text: 'Send magic link again',
                ),
                const Spacer(),
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
                      onTap: () {
                        Get.back();
                      },
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
      ),
    );
  }
}
