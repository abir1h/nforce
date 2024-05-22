import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/main.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.primaryColored = true,
    this.isOutlined = false,
    this.height,
  });
  final VoidCallback onPressed;
  final String text;
  final bool primaryColored;
  final bool isOutlined;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height?.h ?? 50.h,
        width: width,
        decoration: BoxDecoration(
          color: isOutlined ? AppColors.white1 : (primaryColored ? AppColors.primaryBlue1 : AppColors.lightButtonColor),
          borderRadius: BorderRadius.circular(4),
          border: isOutlined ? Border.all(color: AppColors.primaryBlue1) : null,
        ),
        child: Center(
          child: Text(
            text,
            style: CustomTextStyle.heading4.copyWith(
              fontWeight: FontWeight.w500,
              color: isOutlined ? AppColors.primaryBlue1 : (primaryColored ? AppColors.white1 : AppColors.primaryBlue1),
              fontSize: isIpad ? 10.sp : (height != null && height! <= 30 ? 12.sp : null),
            ),
          ),
        ),
      ),
    );
  }
}
