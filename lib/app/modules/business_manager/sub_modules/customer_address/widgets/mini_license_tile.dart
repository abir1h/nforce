import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class MiniLicenseTile extends StatelessWidget {
  const MiniLicenseTile({
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
            'Home service license',
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 16.h,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'HS2023-12345',
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 14.h,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            '25 Jun 2023',
            style: TextStyle(
              color: AppColors.nutralBlack2,
              fontSize: 14.h,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
