import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/controllers/invoice_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

enum CustomType { text, dropdown, dateTime }

class TextWithBottomBorder extends StatefulWidget {
  const TextWithBottomBorder({
    super.key,
    required this.hint,
    required this.type,
    this.onTap,
    this.controller,
    this.textColor = AppColors.nutralBlack1,
  });

  final String hint;
  final TextEditingController? controller;
  final CustomType type;
  final Color textColor;
  final VoidCallback? onTap;

  @override
  State<TextWithBottomBorder> createState() => _TextWithBottomBorderState();
}

class _TextWithBottomBorderState extends State<TextWithBottomBorder> {
  final controller = Get.find<InvoiceController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: DottedBorder(
        customPath: (size) {
          return Path()
            ..moveTo(0, size.height)
            ..lineTo(size.width, size.height);
        },
        child: Text(
          widget.hint,
          style: TextStyle(
            color: widget.textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class CustomDialogWithTextField extends StatelessWidget {
  const CustomDialogWithTextField({
    required this.controller,
    required this.hint,
    required this.onPrimaryButtonPressed,
    required this.onSecondaryButtonPressed,
    this.keyboardType = TextInputType.text,
    super.key,
  });
  final TextEditingController? controller;
  final String hint;
  final VoidCallback onPrimaryButtonPressed;
  final VoidCallback onSecondaryButtonPressed;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              label: '',
              hint: hint,
              controller: controller,
            ),
            10.h.vSpace,
            Row(
              children: [
                Expanded(
                  child: SecondaryButton(
                    onPressed: onSecondaryButtonPressed,
                    text: 'Cancel',
                  ),
                ),
                10.w.hSpace,
                Expanded(
                  child: PrimaryButton(
                    onPressed: onPrimaryButtonPressed,
                    text: 'Ok',
                  ),
                ),
              ],
            ),
            10.h.vSpace,
          ],
        ),
      ),
    );
  }
}
