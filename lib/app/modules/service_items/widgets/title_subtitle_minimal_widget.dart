import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class TitleSubtitleMinimal extends StatelessWidget {
  const TitleSubtitleMinimal({
    required this.title,
    required this.subtitle,
    super.key,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.subText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
