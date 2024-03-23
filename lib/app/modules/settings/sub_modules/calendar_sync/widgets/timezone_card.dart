import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class TimezoneCard extends StatelessWidget {
  const TimezoneCard({super.key, required this.title, required this.subtitle});
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white3),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.nutralBlack1,),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            subtitle,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.nutralBlack2,),
          ),
        ],
      ),
    );
  }
}
