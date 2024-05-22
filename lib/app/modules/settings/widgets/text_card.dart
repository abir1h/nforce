import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class TextCard extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final Color? bgColor;
  final Color? borderColor;
  final Color? textColor;

  const TextCard({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.bgColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: borderColor ?? Colors.transparent),
          color: bgColor ?? AppColors.primaryBlue1,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: CustomTextStyle.paragraphExtraSmall.copyWith(
              color: textColor ?? AppColors.white1,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
