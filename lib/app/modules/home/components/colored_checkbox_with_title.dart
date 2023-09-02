import 'package:flutter/material.dart';
import 'package:nuforce/app/shared/widgets/custom_checkbox.dart';
import 'package:nuforce/app/utils/colors.dart';

class ColoredCheckboxWithTitle extends StatelessWidget {
  const ColoredCheckboxWithTitle({
    super.key,
    required this.isSelected,
    required this.color,
    required this.onChanged,
    required this.title,
  });

  final bool isSelected;
  final Color color;
  final Function(bool?)? onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCheckbox(
          activeColor: color,
          value: isSelected,
          onChanged: onChanged,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.subText,
          ),
        ),
      ],
    );
  }
}
