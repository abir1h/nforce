import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/shared/widgets/custom_checkbox.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/main.dart';

class ColoredCheckboxWithTitle extends StatelessWidget {
  const ColoredCheckboxWithTitle({
    required this.isSelected,
    required this.color,
    required this.onChanged,
    required this.title,
    super.key,
    this.titleColor,
  });

  final bool isSelected;
  final Color color;
  final Color? titleColor;
  final void Function(bool?)? onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: isIpad ? 1.2 : 1,
          child: CustomCheckbox(
            activeColor: color,
            value: isSelected,
            onChanged: onChanged,
          ),
        ),
        5.w.hSpace,
        Text(
          title,
          style: CustomTextStyle.heading5.copyWith(
            color: AppColors.subText,
          ),
        ),
      ],
    );
  }
}
