// ignore_for_file: strict_raw_type, inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class CustomDropdownButtonWithBG extends StatelessWidget {
  const CustomDropdownButtonWithBG({
    required this.items,
    required this.hint,
    required this.onChanged,
    required this.value,
    super.key,
    this.label,
  });
  final List<DropdownMenuItem> items;
  final String hint;
  final Function(dynamic)? onChanged;
  final dynamic value;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: CustomTextStyle.paragraphSmall.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.nutralBlack1,
              // fontSize: 20,
            ),
          ),
        if (label != null) const SizedBox(height: 8),
        Container(
          height: 32.h,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.lightButtonColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: DropdownButton(
            hint: Text(
              hint,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryBlue1,
              ),
            ),
            underline: const SizedBox(),
            isExpanded: true,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.primaryBlue1,
            ),
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryBlue1,
            ),
            items: items,
            value: value,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
