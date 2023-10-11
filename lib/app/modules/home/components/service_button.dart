import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuforce/app/utils/colors.dart';

class ServiceButton extends StatelessWidget {
  const ServiceButton({
    super.key,
    required this.onTap,
    required this.svgPath,
    required this.title,
  });
  final VoidCallback onTap;
  final String svgPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 64.sp,
            width: 72.sp,
            decoration: BoxDecoration(
              color: AppColors.tabbarColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: SvgPicture.asset(svgPath),
            ),
          ),
          SizedBox(height: 4.sp),
          SizedBox(
            width: 72.sp,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.subText,
              ),
            ),
          )
        ],
      ),
    );
  }
}
