import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class CustomTextFieldWithDropdownInside extends StatefulWidget {
  const CustomTextFieldWithDropdownInside({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.items,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.isVisibile = false,
    this.isPassword = false,
    this.onVisibilityTap,
    this.maxLines = 1,
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
  final List<String> items;

  @override
  State<CustomTextFieldWithDropdownInside> createState() => _CustomTextFieldWithDropdownInsideState();
}

class _CustomTextFieldWithDropdownInsideState extends State<CustomTextFieldWithDropdownInside> {
  String? dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: CustomTextStyle.paragraphSmall.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.nutralBlack1,
            // fontSize: 20,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.textFieldBackground,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: AppColors.greyText),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  cursorColor: AppColors.primaryBlue1,
                  autocorrect: false,
                  obscureText: widget.obscureText,
                  maxLines: widget.maxLines,
                  controller: widget.controller,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    suffixIcon: widget.isPassword
                        ? IconButton(
                            onPressed: widget.onVisibilityTap,
                            icon: Icon(
                              widget.isVisibile ? Icons.visibility : Icons.visibility_off,
                              color: AppColors.greyText,
                            ),
                          )
                        : null,
                    hintText: widget.hint,
                    hintStyle: CustomTextStyle.paragraphSmall.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.tabbarColor,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: DropdownButton(
                  value: dropDownValue,
                  items: widget.items.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: TextStyle(
                          color: AppColors.subText,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newVal) {
                    setState(() {
                      dropDownValue = newVal;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
