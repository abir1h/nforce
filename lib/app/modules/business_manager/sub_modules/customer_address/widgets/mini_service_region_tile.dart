import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class MiniServiceRegionTile extends StatelessWidget {
  const MiniServiceRegionTile({
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
      child: Text(
        'Dhaka',
        style: TextStyle(
          color: AppColors.nutralBlack1,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
