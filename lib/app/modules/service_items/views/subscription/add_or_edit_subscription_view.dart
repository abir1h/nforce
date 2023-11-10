import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class AddOrEditSubscriptionView extends StatefulWidget {
  const AddOrEditSubscriptionView({
    super.key,
    required this.isEdit,
  });
  final bool isEdit;

  @override
  State<AddOrEditSubscriptionView> createState() => _AddOrEditSubscriptionViewState();
}

class _AddOrEditSubscriptionViewState extends State<AddOrEditSubscriptionView> {
  String? categoryValue;
  String? unitMetricValue;
  String? taxStatusValue;
  List<String> categoryItems = ['Lawn Services', 'Lawn Services 2', 'Lawn Services 3'];
  List<String> unitMatricsItems = ['Meter (m)', 'Kilogram (kg)', 'Gram (g)', 'Pound (lb)'];
  List<String> taxStatusItems = ['Active', 'Inactive'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(title: widget.isEdit ? 'Edit Subscription' : 'Add new Subscription'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
          child: SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  CustomDropdownButton(
                    label: 'Category',
                    items: categoryItems.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    }).toList(),
                    hint: 'Select Category',
                    onChanged: (v) {
                      setState(() {
                        categoryValue = v as String?;
                      });
                    },
                    value: categoryValue,
                  ),
                  SizedBox(height: 16.h),
                  const CustomTextField(
                    label: 'Item Name',
                    hint: 'Interior Scaping Experts',
                    controller: null,
                  ),
                  SizedBox(height: 16.h),
                  const CustomTextField(
                    label: 'Item Code',
                    hint: 'AS998',
                    controller: null,
                  ),
                  SizedBox(height: 16.h),
                  const CustomTextField(
                    label: 'Instructions',
                    hint: 'Write Instructions...',
                    controller: null,
                    maxLines: 3,
                  ),
                  SizedBox(height: 16.h),
                  const CustomTextField(
                    label: 'Cost',
                    hint: 'Enter cost',
                    controller: null,
                  ),
                  SizedBox(height: 16.h),
                  const CustomTextField(
                    label: 'Quantity',
                    hint: '1',
                    controller: null,
                  ),
                  SizedBox(height: 16.h),
                  CustomDropdownButton(
                    items: unitMatricsItems.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    }).toList(),
                    hint: 'Select Unit Metric',
                    label: 'Unit Metric',
                    onChanged: (v) {
                      setState(() {
                        unitMetricValue = v as String?;
                      });
                    },
                    value: unitMetricValue,
                  ),
                  SizedBox(height: 16.h),
                  const CustomTextField(
                    label: 'Item Discount',
                    hint: 'Enter item discount',
                    controller: null,
                  ),
                  Text(
                    'Ex. Enter 10% or Flat amount',
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const CustomTextField(
                    label: 'Discount Notes',
                    hint: 'Write discount notes...',
                    controller: null,
                  ),
                  SizedBox(height: 16.h),
                  CustomDropdownButton(
                    items: taxStatusItems.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    }).toList(),
                    hint: 'Select Tax Status',
                    label: 'Taxable',
                    onChanged: (v) {
                      setState(() {
                        taxStatusValue = v as String?;
                      });
                    },
                    value: taxStatusValue,
                  ),
                  SizedBox(height: 24.h),
                  PrimaryButton(
                    text: widget.isEdit ? 'Update' : 'Save',
                    onPressed: () {},
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
