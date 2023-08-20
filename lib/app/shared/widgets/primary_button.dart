import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/main.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.primaryColored = true,
  });
  final VoidCallback onPressed;
  final String text;
  final bool primaryColored;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: primaryColored ? AppColors.primaryBlue1 : AppColors.lightButtonColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            text,
            style: CustomTextStyle.heading4.copyWith(
              fontWeight: FontWeight.w500,
              color: primaryColored ? AppColors.white1 : AppColors.primaryBlue1,
            ),
          ),
        ),
      ),
    );
  }
}
