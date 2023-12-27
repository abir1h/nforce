import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class TextCard extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final Color? bgColor;

  const TextCard({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: bgColor ?? AppColors.primaryBlue1,
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          fontFamily: "Poppins",
          color: AppColors.white1,
        ),
      ),
    );
  }
}
