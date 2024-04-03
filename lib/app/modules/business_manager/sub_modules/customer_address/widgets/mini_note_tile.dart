import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class MiniNoteTile extends StatelessWidget {
  const MiniNoteTile({
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
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, vestibulum nunc nec, ultrices nunc.',
        style: TextStyle(
          color: AppColors.nutralBlack2,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
