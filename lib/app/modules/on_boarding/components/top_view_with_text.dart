import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class TopViewWithText extends StatelessWidget {
  const TopViewWithText({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagePath),
        SizedBox(height: 60.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: CustomTextStyle.heading1.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.nutralBlack1,
          ),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: CustomTextStyle.heading4.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.subText,
            ),
          ),
        ),
      ],
    );
  }
}
