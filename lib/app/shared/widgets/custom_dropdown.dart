import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.hint,
    required this.onChanged,
    required this.value,
    required this.label,
  });
  final List<DropdownMenuItem> items;
  final String hint;
  final Function(dynamic)? onChanged;
  final dynamic value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: CustomTextStyle.paragraphSmall.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.nutralBlack1,
            // fontSize: 20,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
            color: AppColors.testFieldBackground,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.greyText),
          ),
          child: DropdownButton(
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
