import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.isVisibile = false,
    this.isPassword = false,
    this.onVisibilityTap,
    this.maxLines = 1,
    this.validator,
  });

  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final VoidCallback? onVisibilityTap;
  final bool isVisibile;
  final bool isPassword;
  final int maxLines;
  final String? Function(String?)? validator;

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
          // height: 50,
          color: AppColors.textFieldBackground,
          child: TextFormField(
            validator: validator,
            cursorColor: AppColors.primaryBlue1,
            autocorrect: false,
            obscureText: obscureText,
            maxLines: maxLines,
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: onVisibilityTap,
                      icon: Icon(
                        isVisibile ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.greyText,
                      ),
                    )
                  : null,
              hintText: hint,
              hintStyle: CustomTextStyle.paragraphSmall.copyWith(
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.greyText,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.greyText,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryBlue1,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
