import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/controllers/auth_controller.dart';
import 'package:nuforce/app/modules/auth/views/otp_view.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

Future<dynamic> varifyEmailBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Image.asset(Assets.images.png.phoneText.path),
            const SizedBox(height: 15),
            Text(
              'Verify Email',
              style: CustomTextStyle.heading2.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.nutralBlack1,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'We sent an OTP to omar@gmail.com Please check your email',
              textAlign: TextAlign.center,
              style: CustomTextStyle.heading5.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.subText,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 150,
              child: PrimaryButton(
                onPressed: () {
                  Get.put(AuthController()).changeFromSignUp(true);
                  Get.to<void>(() => const OtpView());
                },
                text: 'Got It!',
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
    },
  );
}
