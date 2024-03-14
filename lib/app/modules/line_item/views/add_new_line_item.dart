import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/line_item_model.dart';
import 'package:nuforce/app/modules/line_item/controllers/line_item_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class AddNewLineItem extends StatefulWidget {
  const AddNewLineItem({
    super.key,
  });

  @override
  State<AddNewLineItem> createState() => _AddNewLineItemState();
}

class _AddNewLineItemState extends State<AddNewLineItem> {
  final controller = Get.find<LineItemController>();

  String? selectedType;
  String? selectedQuantity;
  double totalBill = 0.00;

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final unitPriceController = TextEditingController();
  final discountController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void reset() {
    nameController.clear();
    descriptionController.clear();
    unitPriceController.clear();
    discountController.clear();
    setState(() {
      selectedType = null;
      selectedQuantity = null;
      totalBill = 0.00;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
            child: Column(
              children: [
                16.h.vSpace,
                CustomDropdownButton(
                  label: 'Item Type',
                  items: ['Item type 1', 'Item type 2', 'Item type 3']
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(
                              color: AppColors.subText,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  hint: 'Item type',
                  onChanged: (v) {
                    setState(() {
                      selectedType = v as String;
                    });
                  },
                  value: selectedType,
                ),
                16.h.vSpace,
                CustomTextField(
                  label: 'Name',
                  hint: 'Enter item name',
                  controller: nameController,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please enter item name';
                    }
                    return null;
                  },
                ),
                16.h.vSpace,
                CustomTextField(
                  label: 'Description',
                  hint: 'Enter item description',
                  maxLines: 3,
                  controller: descriptionController,
                ),
                16.h.vSpace,
                CustomTextField(
                  label: 'Unit Price',
                  hint: 'Enter unit price',
                  controller: unitPriceController,
                  onChange: (value) {
                    setState(() {
                      totalBill = double.parse(value) * int.parse(selectedQuantity!);
                    });
                  },
                ),
                16.h.vSpace,
                CustomTextField(
                  label: 'Discount',
                  hint: 'Ex: 5%',
                  controller: discountController,
                ),
                16.h.vSpace,
                CustomDropdownButton(
                  label: 'Quantity',
                  items: ['1', '2', '3', '4', '5']
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(
                              color: AppColors.subText,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  hint: 'Select Quantity',
                  onChanged: (v) {
                    setState(() {
                      selectedQuantity = v as String;
                      totalBill = double.parse(unitPriceController.text) * int.parse(selectedQuantity!);
                    });
                  },
                  value: selectedQuantity,
                ),
              ],
            ),
          ),
          24.h.vSpace,
          Container(
            color: AppColors.textFieldBackground,
            padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total billing amount',
                  style: TextStyle(
                    color: AppColors.subText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$${(totalBill.toStringAsFixed(2))}',
                  style: TextStyle(
                    color: AppColors.subText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          24.h.vSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 5.h),
            child: Row(
              children: [
                Expanded(
                  child: SecondaryButton(
                    text: 'Reset',
                    onPressed: () {
                      reset();
                    },
                  ),
                ),
                16.w.hSpace,
                Expanded(
                  child: PrimaryButton(
                    text: 'Save Line Item',
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      if (selectedQuantity == null) {
                        Fluttertoast.showToast(msg: 'Please select quantity');
                        return;
                      }

                      if (selectedType == null) {
                        Fluttertoast.showToast(msg: 'Please select item type');
                        return;
                      }

                      controller.addItem(
                        LineItem(
                          id: DateTime.now().millisecondsSinceEpoch,
                          name: nameController.text,
                          description: descriptionController.text,
                          discount: discountController.text,
                          quantity: selectedQuantity!,
                          itemType: selectedType!,
                          unitPrice: unitPriceController.text,
                          totoalBill: totalBill.toString(),
                        ),
                      );
                      reset();
                    },
                  ),
                ),
              ],
            ),
          ),
          24.h.vSpace,
        ],
      ),
    );
  }
}
