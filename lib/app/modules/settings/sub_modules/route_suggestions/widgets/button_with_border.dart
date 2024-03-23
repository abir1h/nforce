import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/text_styles.dart';

class BorderButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color? color;

  const BorderButton({
    Key? key,
    required this.text,
    this.onTap, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: color??AppColors.green3),
        ),
        child: Center(
          child: Text(
            text,
            style: CustomTextStyle.heading4.copyWith(
              fontWeight: FontWeight.w500,
              color:  color??AppColors.green3,
            ),
          ),
        ),
      ),
    );
  }
}
