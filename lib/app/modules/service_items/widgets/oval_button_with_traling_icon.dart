import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class OvalButtonWithTralingIcon extends StatelessWidget {
  const OvalButtonWithTralingIcon({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon,
  });
  final String text;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.white1,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryBlue1,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              icon,
              color: AppColors.primaryBlue1,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
