import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class LittleTextWithColoredBG extends StatelessWidget {
  const LittleTextWithColoredBG({
    super.key,
    required this.text,
    required this.color,
  });
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 1.sp),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4.sp),
      ),
      child: Text(
        text,
        style: CustomTextStyle.paragraphExtraSmall.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
