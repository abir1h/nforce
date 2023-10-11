import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class CustomTabBarFilled extends StatelessWidget {
  const CustomTabBarFilled({
    super.key,
    required this.text,
    required this.onTap,
    required this.isSelected,
    this.isMini = false,
  });

  final String text;
  final VoidCallback onTap;
  final bool isSelected;
  final bool isMini;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: isSelected ? AppColors.primaryBlue1 : AppColors.primaryBlue3,
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 13.sp),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? AppColors.white1 : AppColors.nutralBlack1,
              fontSize: isMini ? 12 : 20,
              fontWeight: isMini ? FontWeight.w500 : FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
