import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class MiniEventTile extends StatelessWidget {
  const MiniEventTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.greyStrokColor,
        ),
        color: AppColors.bgWithOpacity,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Meeting',
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          4.h.vSpace,
          Text(
            '12-23-23',
            style: TextStyle(
              color: AppColors.nutralBlack2,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
