import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class CustomTabBarFilled extends StatelessWidget {
  const CustomTabBarFilled({
    required this.text,
    required this.onTap,
    required this.isSelected,
    super.key,
    this.isMini = false,
    this.svgPath,
  });

  final String text;
  final VoidCallback onTap;
  final bool isSelected;
  final bool isMini;
  final String? svgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.greyText,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: isSelected ? AppColors.primaryBlue1 : AppColors.primaryBlue3,
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 13.sp),
          child: Center(
            child: Row(
              children: [
                if (svgPath != null) ...[
                  SvgPicture.asset(
                    svgPath!,
                    colorFilter: ColorFilter.mode(
                      isSelected ? AppColors.white1 : AppColors.nutralBlack1,
                      BlendMode.srcIn,
                    ),
                  ),
                  4.w.hSpace,
                ],
                Text(
                  text,
                  style: TextStyle(
                    color: isSelected ? AppColors.white1 : AppColors.nutralBlack1,
                    fontSize: isMini ? 12.sp : 20.sp,
                    fontWeight: isMini ? FontWeight.w500 : FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
