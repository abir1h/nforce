import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class TextboxWithButtonInside extends StatelessWidget {
  const TextboxWithButtonInside({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.inactiveTabbarColor,
        border: Border.all(
          color: AppColors.inactiveColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.sp, right: 8.sp),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Enter Coupon Code',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4.sp),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.lightButtonColor,
                ),
                child: Text(
                  'Apply',
                  style: TextStyle(
                    color: AppColors.primaryBlue1,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
