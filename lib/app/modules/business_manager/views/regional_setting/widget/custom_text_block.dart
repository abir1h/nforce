import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class CustomTextBlock extends StatelessWidget {
  final String label, value;
  const CustomTextBlock({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,color: AppColors.nutralBlack2,
              fontFamily: "Poppins"),
        ),
        Text(
          value,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,color: AppColors.nutralBlack1,
              fontFamily: "Poppins"),
        ),
      ],
    );
  }
}
