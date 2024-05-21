import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class CustomTextStyle {
  static TextStyle heading1 = TextStyle(
    fontSize: isIpad ? 20.sp : 24.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle heading2 = TextStyle(
    fontSize: isIpad ? 18.sp : 20.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heading3 = TextStyle(
    fontSize: isIpad ? 16.sp : 18.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heading4 = TextStyle(
    fontSize: isIpad ? 12.sp : 16.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heading5 = TextStyle(
    fontSize: isIpad ? 10.sp : 14.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle paragraphLarge = TextStyle(
    fontSize: isIpad ? 14.sp : 18.sp,
  );

  static TextStyle paragraphMedium = TextStyle(
    fontSize: isIpad ? 12.sp : 16.sp,
  );

  static TextStyle paragraphSmall = TextStyle(
    fontSize: isIpad ? 10.sp : 14.sp,
  );

  static TextStyle paragraphExtraSmall = TextStyle(
    fontSize: isIpad ? 8.sp : 12.sp,
  );
  static TextStyle commonBold = TextStyle(fontSize: 16.sp, color: AppColors.nutralBlack1, fontWeight: FontWeight.w600, fontFamily: "Poppins");
  static TextStyle commonTitle = TextStyle(fontSize: 16.sp, color: AppColors.nutralBlack1, fontWeight: FontWeight.w500, fontFamily: "Poppins");
  static TextStyle commonLabel = TextStyle(fontSize: 14.sp, color: AppColors.subText, fontWeight: FontWeight.w400, fontFamily: "Poppins");
}
