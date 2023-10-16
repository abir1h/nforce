import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class LandingPageUrlTextBox extends StatelessWidget {
  const LandingPageUrlTextBox({
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
                  hintText: 'https://app.nuforce.pro/',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4.sp),
            child: GestureDetector(
              onTap: () {
                Fluttertoast.showToast(msg: 'Copied');
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 12.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.primaryBlue1,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.images.svg.copyIcon),
                    SizedBox(width: 4.sp),
                    Text(
                      'Copy',
                      style: TextStyle(
                        color: AppColors.white1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
