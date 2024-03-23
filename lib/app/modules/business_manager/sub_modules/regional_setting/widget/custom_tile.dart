import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    required this.lable,
    required this.onTap,
    super.key,
    this.hasTraillingIcon = true,
  });

  final String lable;
  final VoidCallback onTap;
  final bool? hasTraillingIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.tileBackground,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.white3, width: 1.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              lable,
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontFamily: "Poppins",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            hasTraillingIcon == false
                ? const SizedBox()
                : const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
          ],
        ),
      ),
    );
  }
}
