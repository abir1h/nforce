import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class NewServiceOverviewBody extends StatelessWidget {
  const NewServiceOverviewBody({
    super.key,
    required this.itemNameController,
    required this.itemCodeController,
    required this.priceController,
    required this.quantityController,
    required this.whatsIncludedController,
    required this.itemDiscountNoteController,
  });

  final TextEditingController itemNameController;
  final TextEditingController itemCodeController;
  final TextEditingController priceController;
  final TextEditingController quantityController;
  final TextEditingController whatsIncludedController;
  final TextEditingController itemDiscountNoteController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image picker
        SvgPicture.asset(Assets.images.svg.pickImage), // TODO Make it dynamic
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Item Name*',
          hint: 'Enter item name',
          controller: itemNameController,
        ),
        const SizedBox(height: 16),
        Text(
          'Category*',
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        CustomDropdownButton(
          items: [
            DropdownMenuItem(
              value: 'Lawn Service0',
              child: Text(
                'Lawn Service',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'Lawn Service1',
              child: Text(
                'Floor Cleaning',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
          hint: 'Select Category',
          onChanged: (v) {},
          value: 'Lawn Service0',
        ),
        const SizedBox(height: 16),
        Text(
          'Unit Matric*',
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        CustomDropdownButton(
          items: [
            DropdownMenuItem(
              value: 'KG',
              child: Text(
                'KG',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'Pounds',
              child: Text(
                'Pounds',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
          hint: 'Select Category',
          onChanged: (v) {},
          value: 'KG',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Item Code*',
          hint: 'Enter item code',
          controller: itemCodeController,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Price*',
          hint: 'Enter item code',
          controller: priceController,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Quantity*',
          hint: 'Enter quantity',
          controller: quantityController,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: "What's included",
          hint: 'Write details...',
          controller: whatsIncludedController,
          maxLines: 3,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: "Why choos us",
          hint: 'Write details...',
          controller: whatsIncludedController,
          maxLines: 3,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: "Item Discount",
          hint: 'Enter item discount',
          controller: whatsIncludedController,
        ),
        const SizedBox(height: 3),
        Text(
          'Ex. Enter 10% or Flat amount',
          style: TextStyle(
            color: AppColors.greyText,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: "Discount Notes",
          hint: 'Write discount notes...',
          controller: itemDiscountNoteController,
          maxLines: 3,
        ),
        const SizedBox(height: 16),
        Text(
          'Taxable',
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        CustomDropdownButton(
          items: [
            DropdownMenuItem(
              value: 'Not allowed',
              child: Text(
                'Not allowed',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'Tax included',
              child: Text(
                'Tax included',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
          hint: 'Select Category',
          onChanged: (v) {},
          value: 'Not allowed',
        ),
        const SizedBox(height: 24),
        PrimaryButton(onPressed: () {}, text: 'Save'),
        SizedBox(height: 8.sp),
      ],
    );
  }
}
