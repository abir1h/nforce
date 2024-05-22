import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

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
              padding: EdgeInsets.only(left: 16.w, right: 8.w),
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
            padding: EdgeInsets.all(4.h),
            child: GestureDetector(
              onTap: () {
                Fluttertoast.showToast(msg: 'Copied');
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.primaryBlue1,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.images.svg.copyIcon,
                      height: isIpad ? 20 : null,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Copy',
                      style: CustomTextStyle.heading4.copyWith(
                        color: AppColors.white1,
                        fontWeight: FontWeight.w400,
                      ),
                      // style: TextStyle(
                      //   color: AppColors.white1,
                      //   fontSize: 16.sp,
                      //   fontWeight: FontWeight.w400,
                      // ),
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
