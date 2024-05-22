import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/main.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.height,
  });
  final VoidCallback onPressed;
  final String text;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height?.h ?? 50.h,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: AppColors.red,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: CustomTextStyle.heading4.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.red,
              fontSize: isIpad ? 10.sp : (height != null && height! <= 30 ? 12.sp : 16.sp),
            ),
          ),
        ),
      ),
    );
  }
}
