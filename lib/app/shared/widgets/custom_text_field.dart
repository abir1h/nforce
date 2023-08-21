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
  });

  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final VoidCallback? onVisibilityTap;
  final bool isVisibile;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        cursorColor: AppColors.primaryBlue1,
        autocorrect: false,
        obscureText: obscureText,
        obscuringCharacter: '*',
        controller: controller,
        decoration: InputDecoration(
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
          labelStyle: CustomTextStyle.paragraphSmall.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.nutralBlack1,
            // fontSize: 20,
          ),
          labelText: label,
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
    );
  }
}
