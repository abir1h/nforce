import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:nuforce/app/utils/colors.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.textFieldBackground,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.white3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 34.h,
                      width: 34.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue3,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: SvgPicture.asset(
                          svgPath,
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
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ), // ToDo set imagepath as your own

            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
