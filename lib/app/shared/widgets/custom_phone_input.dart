import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class CustomPhoneInput extends StatelessWidget {
  const CustomPhoneInput({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
  });

  final String label;
  final String hint;
  final TextEditingController? controller;

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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: AppColors.greyText,
            ),
            color: AppColors.textFieldBackground,
          ),
          child: Center(
            child: InternationalPhoneNumberInput(
              cursorColor: AppColors.primaryBlue1,
              inputDecoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 16,
                ),
                border: InputBorder.none,
                hintText: hint,
                hintStyle: CustomTextStyle.paragraphSmall.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.nutralBlack1,
                ),
              ),
              onInputChanged: (PhoneNumber number) {},
              onInputValidated: (bool value) {},
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.DROPDOWN,
                trailingSpace: false,
              ),
              ignoreBlank: true,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: const TextStyle(color: AppColors.subText),
              textFieldController: controller,
              formatInput: true,
              keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
              inputBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.greyText),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              initialValue: PhoneNumber(isoCode: 'US'),
              onSaved: (PhoneNumber number) {},
            ),
          ),
        ),
      ],
    );
  }
}
