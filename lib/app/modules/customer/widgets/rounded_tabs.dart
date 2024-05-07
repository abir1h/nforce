import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class RoundedTabs extends StatelessWidget {
  const RoundedTabs({
    required this.text,
    required this.onTap,
    required this.isSelected,
    super.key,
    this.isTopRightCurved = false,
    this.isTopLeftCurved = false,
  });

  final String text;
  final VoidCallback onTap;
  final bool isSelected;
  final bool isTopRightCurved;
  final bool isTopLeftCurved;

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
          decoration: BoxDecoration(
            borderRadius:BorderRadius.only(
                topLeft:isTopLeftCurved? Radius.circular(25.r):Radius.circular(0),
                topRight:isTopRightCurved? Radius.circular(25.r):Radius.circular(0)

            ),
            color: isSelected?AppColors.primaryBlue1:AppColors.primaryBlue3
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 13.sp),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? AppColors.white1 : AppColors.nutralBlack2,
                fontSize: 14.sp,
                fontWeight:  FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
