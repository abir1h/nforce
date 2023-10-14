import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
class XStartRating extends StatelessWidget {
  const XStartRating({
    super.key,
    required this.x,
    required this.count,
    required this.total,
  });
  final int x;
  final int count;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        for (int i = 0; i < x; i++)
          Icon(
            Icons.star_rounded,
            color: AppColors.yellow,
            size: 14.sp,
          ),
        const SizedBox(width: 10),
        Container(
          height: 8.sp,
          width: 114.sp * (count / total) + 10,
          decoration: BoxDecoration(
            color: AppColors.yellow,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const Spacer(),
        Text(
          count.toString(),
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
