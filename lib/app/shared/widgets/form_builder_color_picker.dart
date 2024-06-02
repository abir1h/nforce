import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class FormBuilderColorPicker extends StatefulWidget {
  const FormBuilderColorPicker({
    required this.onColorChanged,
    required this.pickerColor,
    super.key,
    this.label,
  });

  final String? label;
  final String pickerColor;
  final void Function(String) onColorChanged;

  @override
  State<FormBuilderColorPicker> createState() => _FormBuilderColorPickerState();
}

class _FormBuilderColorPickerState extends State<FormBuilderColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: CustomTextStyle.paragraphSmall.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.nutralBlack1,
              // fontSize: 20,
            ),
          ),
        InkWell(
          onTap: () {
            showDialog<void>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  scrollable: true,
                  content: ColorPicker(
                    pickerColor: Color(int.parse(widget.pickerColor)),
                    onColorChanged: (color) {
                      widget.onColorChanged(color.value.toRadixString(16).substring(2));
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                          color: AppColors.primaryBlue1,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.textFieldBackground,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.greyText),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    // '${widget.pickerColor.red}${widget.pickerColor.green}${widget.pickerColor.blue}',
                    widget.pickerColor,
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.white3,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          // color: widget.pickerColor,
                          color: Color(int.parse(widget.pickerColor)),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.nutralBlack2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
