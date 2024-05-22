import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class ServiceButton extends StatelessWidget {
  const ServiceButton({
    required this.onTap,
    required this.svgPath,
    required this.title,
    super.key,
  });
  final VoidCallback onTap;
  final String svgPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: isIpad ? 64.h : null,
            width: isIpad ? 72.h : null,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.tabbarColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: SvgPicture.asset(
                svgPath,
                height: isIpad ? 35.h : null,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isIpad ? 8.sp : 11.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.subText,
            ),
          ),
        ],
      ),
    );
  }
}
