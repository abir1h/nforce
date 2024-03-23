import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class ChooseButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const ChooseButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primaryBlue3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
          fontFamily: "Poppins",
          color: AppColors.primaryBlue1,
        ),
      ),
    );
  }
}
