import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'Skip',
        style: CustomTextStyle.heading4.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.greyText,
        ),
      ),
    );
  }
}
