import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
  });
  final bool? value;
  final Function(bool?)? onChanged;
  final Color? activeColor;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        checkboxTheme: CheckboxThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          checkColor: MaterialStateColor.resolveWith((states) => AppColors.white1),
          fillColor: MaterialStateColor.resolveWith((states) => activeColor ?? AppColors.primaryBlue1),
          side: BorderSide(color: activeColor ?? AppColors.inactiveColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      child: Checkbox(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
