import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

enum DialogType { warning, error, success, info }

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.dialogType,
    required this.title,
    required this.content,
    this.secondaryText,
    required this.primaryText,
    this.onSecondaryButtonPressed,
    required this.onPrimaryButtonPress,
    this.canPop = true,
  });

  final String title;
  final String content;
  final String? secondaryText;
  final String primaryText;
  final VoidCallback? onSecondaryButtonPressed;
  final VoidCallback onPrimaryButtonPress;
  final bool canPop;
  final DialogType dialogType;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: AppColors.white1,
        child: Container(
          padding: const EdgeInsets.all(30),
          width: Get.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryBlue1,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                content,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 40.h),
              Row(
                children: [
                  if (secondaryText != null) ...[
                    Expanded(
                      child: SecondaryButton(
                        height: 36.h,
                        onPressed: onSecondaryButtonPressed ?? () {},
                        text: secondaryText ?? '',
                      ),
                    ),
                    10.w.hSpace,
                  ],
                  Expanded(
                    child: PrimaryButton(
                      height: 36.h,
                      onPressed: onPrimaryButtonPress,
                      text: primaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
