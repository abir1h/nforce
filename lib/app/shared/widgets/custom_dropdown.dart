// ignore_for_file: strict_raw_type, inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  const CustomDropdownButton({
    required this.items,
    required this.hint,
    required this.onChanged,
    required this.value,
    super.key,
    this.label,
  });

  CustomDropdownButton copyWith({
    List<DropdownMenuItem<T>>? items,
    String? hint,
    void Function(T?)? onChanged,
    T? value,
    String? label,
  }) {
    return CustomDropdownButton<T>(
      items: items ?? this.items,
      hint: hint ?? this.hint,
      onChanged: onChanged ?? this.onChanged,
      value: value ?? this.value,
      label: label ?? this.label,
    );
  }

  final List<DropdownMenuItem<T>> items;
  final String hint;
  final void Function(T?)? onChanged;
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
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
            color: AppColors.textFieldBackground,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.greyText),
          ),
          child: DropdownButton<T>(
            hint: Text(
              hint,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.subText,
              ),
            ),
            underline: const SizedBox(),
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.greyText,
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
