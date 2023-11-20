import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nuforce/app/modules/service_items/widgets/coupon_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field_with_dropdown_inside.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

class CreateOrEditCouponView extends StatefulWidget {
  const CreateOrEditCouponView({
    super.key,
    required this.isEditing,
    this.couponDataModel,
    this.onButtonTap,
  });
  final bool isEditing;
  final CouponDataModel? couponDataModel;
  final VoidCallback? onButtonTap;

  @override
  State<CreateOrEditCouponView> createState() => _CreateOrEditCouponView();
}

class _CreateOrEditCouponView extends State<CreateOrEditCouponView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController couponController = TextEditingController();
  String? dropDownValue;
  String? selectedDate;
  @override
  void dispose() {
    titleController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.isEditing) {
      titleController.text = widget.couponDataModel!.offerTitleText;
      detailsController.text = widget.couponDataModel!.offerDetailsText;
      couponController.text = widget.couponDataModel!.offerValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(title: widget.isEditing ? 'Edit Coupon' : 'Create Coupon'),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
          child: Column(
            children: [
              const SizedBox(height: 16),
              CustomTextField(label: 'Title', hint: 'Enter coupon title', controller: titleController),
              const SizedBox(height: 16),
              CustomTextField(label: 'Coupon Code', hint: 'Add coupon code', controller: detailsController),
              const SizedBox(height: 16),
              CustomTextFieldWithDropdownInside(
                label: 'Coupon Type',
                hint: 'Ex 10',
                controller: couponController,
                items: const ['Percentage', 'Fixed Amount'],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  ).then((value) {
                    setState(() {
                      selectedDate = '${value!.day}-${value.month}-${value.year}';
                    });
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Expire date',
                      style: CustomTextStyle.paragraphSmall.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.nutralBlack1,
                        // fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.textFieldBackground,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppColors.greyText),
                      ),
                      child: Row(
                        children: [
                          Text(
                            selectedDate ?? 'DD-MM-YYYY',
                            style: TextStyle(
                              color: AppColors.subText,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(Assets.images.svg.calendarMonth),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              CustomDropdownButton(
                items: const [
                  DropdownMenuItem(
                    value: 'Active',
                    child: Text('Active'),
                  ),
                  DropdownMenuItem(
                    value: 'Inactive',
                    child: Text('Inactive'),
                  ),
                ],
                hint: 'Active',
                label: 'Status',
                onChanged: (v) {
                  setState(() {
                    dropDownValue = v as String?;
                  });
                },
                value: dropDownValue,
              ),
              const Spacer(),
              PrimaryButton(
                onPressed: () {},
                text: widget.isEditing ? 'Update' : 'Save',
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
