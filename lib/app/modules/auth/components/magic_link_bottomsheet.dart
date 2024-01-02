import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

Future<dynamic> magicLinkBottomSheet(BuildContext context) {
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
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Image.asset(Assets.images.png.phoneText.path),
            const SizedBox(height: 15),
            Text(
              'Magic link sent',
              style: CustomTextStyle.heading2.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.nutralBlack1,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'We sent magic link to omar@gmail.com Please check your email',
              textAlign: TextAlign.center,
              style: CustomTextStyle.heading5.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.subText,
              ),
            ),
            const SizedBox(height: 30),
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
