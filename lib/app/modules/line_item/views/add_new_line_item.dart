import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/line_item_model.dart';
import 'package:nuforce/app/modules/line_item/controllers/line_item_controller.dart';
import 'package:nuforce/app/modules/line_item/controllers/line_item_form_controller.dart';
import 'package:nuforce/app/modules/line_item/models/control.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/main.dart';

class AddNewLineItem extends StatefulWidget {
  const AddNewLineItem({
    super.key,
  });

  @override
  State<AddNewLineItem> createState() => _AddNewLineItemState();
}

class _AddNewLineItemState extends State<AddNewLineItem> {
  final controller = Get.find<LineItemController>();
  late final LineItemFormController formController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    formController = Get.put(LineItemFormController());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 5),
              child: GetBuilder<LineItemFormController>(
                builder: (controller) {
                  if (controller.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: controller.formBuilder.fieldNames.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      final name = controller.formBuilder.fieldNames[index];
                      Widget? widget = controller.formBuilder.widgets[name];
                      if (widget != null && widget.runtimeType == CustomDropdownButton<Option?>) {
                        widget = (widget as CustomDropdownButton<Option?>).copyWith(
                          onChanged: (value) {
                            controller.updateOnChanged(name, value);
                          },
                          value: controller.formBuilder.dropdownValue[name],
                        );

                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: widget,
                        );
                      }

                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: widget ?? const SizedBox.shrink(),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Column(
            children: [
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
                    GetBuilder<LineItemFormController>(
                      builder: (controller) {
                        return SizedBox(
                          width: width * 0.4,
                          child: Text(
                            '\$${(controller.totalBill.toStringAsFixed(2))}',
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.subText,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              10.h.vSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 5.h),
                child: Row(
                  children: [
                    Expanded(
                      child: SecondaryButton(
                        text: 'Reset',
                        onPressed: () {},
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

                          controller.addItem(
                            LineItem(
                              id: 0,
                              unitCost: formController.formBuilder.textEditingControllers['unitCost']?.text ?? '',
                              quantity: formController.formBuilder.textEditingControllers['quantity']?.text ?? '',
                              discount: formController.formBuilder.textEditingControllers['discount']?.text ?? '',
                              details: formController.formBuilder.textEditingControllers['description']?.text ?? '',
                              totalCost: formController.totalBill.toStringAsFixed(2),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              24.h.vSpace,
            ],
          ),
        ],
      ),
    );
  }
}
