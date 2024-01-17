import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.greyText,
                width: 1,
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'find contact by name, notes, etc.',
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: SvgPicture.asset(
                    Assets.images.svg.search,
                    height: 18.h,
                    fit: BoxFit.contain,
                    width: 18.h,
                    color: AppColors.greyText,
                  ),
                ),
                hintStyle: TextStyle(
                  color: AppColors.greyText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Container(
          padding: EdgeInsets.all(16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.primaryBlue1,
          ),
          child: SvgPicture.asset(Assets.images.svg.filter2),
        ),
      ],
    );
  }
}
