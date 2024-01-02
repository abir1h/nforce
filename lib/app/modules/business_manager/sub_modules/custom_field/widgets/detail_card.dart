import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class DetailCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;

  const DetailCard({
    required this.title,
    super.key,
    this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
      decoration: BoxDecoration(
        color: AppColors.textFieldBackground,
        border: Border.all(color: AppColors.white3, width: 1.h),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.nutralBlack2,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
              ],
            ),
          ),
          Icon(
            icon ?? Icons.arrow_forward_ios,
            color: AppColors.nutralBlack1,
            size: 24.r,
          ),
        ],
      ),
    );
  }
}
