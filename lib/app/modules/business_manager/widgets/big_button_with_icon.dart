import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class BigButtonWithIcon extends StatelessWidget {
  const BigButtonWithIcon({
    required this.svgPath,
    required this.lable,
    required this.onTap,
    super.key,
  });

  final String svgPath;
  final String lable;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.tileBackground,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.white3, width: 1.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: isIpad ? 40.h : 34.h,
                      width: isIpad ? 40.h : 34.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue3,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: SvgPicture.asset(
                          svgPath,
                          height: isIpad ? 25.h : null,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Text(
                  lable,
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: isIpad ? 10.sp : 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: isIpad ? 10.sp : 14.sp,
            ),
          ],
        ),
      ),
    );
  }
}
