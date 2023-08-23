import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/controllers/auth_controller.dart';
import 'package:nuforce/app/modules/auth/views/otp_view.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

Future<dynamic> accountCreationComplete(BuildContext context) {
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
            SvgPicture.asset(Assets.images.svg.success),
            const SizedBox(height: 15),
            Text(
              'Congratulation',
              style: CustomTextStyle.heading2.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.nutralBlack1,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Than you! Your profile creation is\ncomplete.',
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
                  final controller = Get.put(AuthController());
                  controller.fromSignUp.value = true;
                  Get.to(() => const OtpView());
                },
                text: 'Done',
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
    },
  );
}
