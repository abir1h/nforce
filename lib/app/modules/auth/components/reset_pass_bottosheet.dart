import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

Future<dynamic> resetPasswordBottomSheet(BuildContext context) {
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
              'Password Changed',
              style: CustomTextStyle.heading2.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.nutralBlack1,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Your password has been\nsuccessfully changed!',
              textAlign: TextAlign.center,
              style: CustomTextStyle.heading5.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.subText,
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.primaryBlue1,
                ),
                child: Text(
                  'Done',
                  style: CustomTextStyle.heading5.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.white1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
    },
  );
}
