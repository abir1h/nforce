import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    required this.value,
    required this.onChanged,
    super.key,
    this.activeColor,
  });
  final bool value;
  final void Function(bool?)? onChanged;
  final Color? activeColor;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        checkboxTheme: CheckboxThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          checkColor: MaterialStateColor.resolveWith((states) => AppColors.white1),
          fillColor: MaterialStateColor.resolveWith(
            (states) => value ? activeColor ?? AppColors.primaryBlue1 : AppColors.white1,
          ),
          side: BorderSide(color: activeColor ?? AppColors.inactiveColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      child: Transform.scale(
        scale: isIpad ? 1.4 : 1,
        child: Checkbox(
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
