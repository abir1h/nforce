import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class PackageTileDetailsInfoWidget extends StatelessWidget {
  const PackageTileDetailsInfoWidget({
    super.key,
    required this.left,
    required this.right,
    this.rightColor = AppColors.nutralBlack1,
  });
  final String left;
  final String right;
  final Color rightColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: width / 2,
          child: Text(
            left,
            style: TextStyle(
              color: AppColors.subText,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.28,
            ),
          ),
        ),
        Text(
          ': ',
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          right,
          style: TextStyle(
            color: rightColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
