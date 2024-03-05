import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class ColoredButton extends StatelessWidget {
  const ColoredButton({
    required this.text,
    required this.textColor,
    this.height = 38,
    super.key,
  });

  final String text;
  final Color textColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: height.h,
      decoration: BoxDecoration(
        color: textColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Center(
        child: Text(
          text,
          style: CustomTextStyle.heading5.copyWith(
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
