import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/shared/widgets/custom_checkbox.dart';
import 'package:nuforce/app/utils/colors.dart';

class NotificationCheckBox extends StatelessWidget {
  const NotificationCheckBox({
    required this.isSelected,
    required this.color,
    required this.onChanged,
    required this.title,
    super.key,
  });

  final bool isSelected;
  final Color color;
  final void Function(bool?)? onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 12.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.inactiveTabbarColor,
        border: Border.all(
          color: AppColors.inactiveColor,
        ),
      ),
      child: Row(
        children: [

          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ), CustomCheckbox(
            activeColor: color,
            value: isSelected,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
