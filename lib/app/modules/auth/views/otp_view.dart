import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/main.dart';
import 'package:pinput/pinput.dart';

import '../controllers/auth_controller.dart';

class OtpView extends GetView<AuthController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.greyText),
      ),
    );

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
                Text(
                  'Verification',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.heading1.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.nutralBlack1,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'We’ve the code send to your Phone number- random@gmail.com ',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.heading4.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.subText,
                  ),
                ),
                const SizedBox(height: 30),
                Pinput(
                  controller: controller.pinController,
                  focusNode: controller.focusNode,
                  androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 8),
                  length: 6,
                  validator: (value) {
                    return value == '123123' ? null : 'Wrong OTP. The correct OTP is 123123';
                  },
                  // hapticFeedbackType: HapticFeedbackType.lightImpact,
                  showCursor: true,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.primaryBlue1),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.primaryBlue1),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: AppColors.red),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  '00:56',
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.heading4.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.nutralBlack1,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn’t receive code? ',
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.heading5.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.subText,
                      ),
                    ),
                    Text(
                      'Resend Code',
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.heading5.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryBlue1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  onPressed: () {
                    controller.navigateFromOtpView();
                  },
                  text: 'Done',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
