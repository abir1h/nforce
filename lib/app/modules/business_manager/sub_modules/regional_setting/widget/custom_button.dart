import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/main.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.primaryColored = true, this.borderColor, this.textStyle,
  });
  final VoidCallback onPressed;
  final String text;
  final bool primaryColored;
  final Color? borderColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: primaryColored ? AppColors.primaryBlue1 : Colors.transparent,border: Border.all(color: borderColor??Colors.transparent,width: 1.h),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle??CustomTextStyle.heading4.copyWith(
              fontWeight: FontWeight.w500,

              color: primaryColored ? AppColors.white1 : AppColors.primaryBlue1,
            ),
          ),
        ),
      ),
    );
  }
}
