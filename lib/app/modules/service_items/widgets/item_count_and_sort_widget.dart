import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class ItemCountAndSort extends StatelessWidget {
  final String items;
  const ItemCountAndSort({
    super.key, required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total Items ($items)',
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          padding: EdgeInsets.all(3.5.sp),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryBlue3,
          ),
          child: SvgPicture.asset(Assets.images.svg.sort),
        ),
      ],
    );
  }
}
