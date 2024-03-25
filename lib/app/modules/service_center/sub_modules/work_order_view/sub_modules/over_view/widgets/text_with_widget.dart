import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class TextWithWidget extends StatelessWidget {

  const TextWithWidget(
      {super.key, required this.firstItem, required this.secondItem, this.bgColor});
  final String firstItem, secondItem;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 26.w, bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 50,
            child: Text(
              firstItem,
              style: TextStyle(
                color: AppColors.nutralBlack2,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                fontFamily: 'Inter',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              ":",
              style: TextStyle(
                color: AppColors.nutralBlack2,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                fontFamily: 'Inter',
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: bgColor??AppColors.lightBlueBg),
                  child: Text(
                    secondItem,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      fontFamily: "Poppins",
                      color: bgColor!=null?AppColors.darkYellow:AppColors.primaryBlue1,
                    ),
                  ),
                ),
                Expanded(
                    child: SizedBox(
                  width: 10,
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
