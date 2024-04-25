import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class CustomTimeField extends StatelessWidget {
  const CustomTimeField({
    super.key,
    this.label,
    this.selectedTime,
    this.hint,
    this.onChanged,
  });

  final String? label;
  final String? selectedTime;
  final String? hint;
  final ValueChanged<TimeOfDay>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: CustomTextStyle.paragraphSmall.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.nutralBlack1,
              // fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
        ],
        GestureDetector(
          onTap: () {
            showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then((value) {
              if (value != null) {
                onChanged?.call(value);
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: AppColors.greyText,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedTime ?? 'Select Time',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Icon(Icons.schedule, color: AppColors.nutralBlack1)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
