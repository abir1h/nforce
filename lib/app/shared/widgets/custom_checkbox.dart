import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });
  final bool? value;
  final Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        checkboxTheme: CheckboxThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          checkColor: MaterialStateColor.resolveWith((states) => AppColors.white1),
          fillColor: MaterialStateColor.resolveWith((states) => AppColors.primaryBlue1),
          side: const BorderSide(color: AppColors.inactiveColor),
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
