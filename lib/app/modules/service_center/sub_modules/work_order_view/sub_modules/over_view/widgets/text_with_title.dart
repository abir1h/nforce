
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';


class TextWithTitle extends StatelessWidget  {
  const TextWithTitle({super.key, required this.firstItem, required this.secondItem});
  final String firstItem,secondItem;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.only(
          right: 26.w,bottom: 8.h),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 50,
            child: Text(
              firstItem,
              style: TextStyle(
                color: AppColors.nutralBlack2,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                fontFamily:
                'Inter',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal:8),
            child: Text(
              ":",
              style: TextStyle(
                color: AppColors.nutralBlack2,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                fontFamily:
                'Inter',
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Text(
              secondItem,
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                fontFamily:
                'Inter',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
