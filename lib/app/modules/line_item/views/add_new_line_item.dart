import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/line_item/controllers/line_item_controller.dart';
import 'package:nuforce/app/modules/line_item/controllers/line_item_form_controller.dart';
import 'package:nuforce/app/modules/line_item/controllers/line_item_lookup_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';
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
    Get.put(LineItemLookupController());
  }

  @override
  void dispose() {
    Get.delete<LineItemLookupController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LineItemController>(builder: (context) {
      return CustomLoadingWidget(
        isLoading: context.isLoading,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 5),
                  child: Stack(
                    children: [
                      GetBuilder<LineItemFormController>(
                        builder: (controller) {
                          if (controller.formLoading) {
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

                              if (name == 'paramsLineitemFinder') {
                                widget = (widget as CustomTextField).copyWith(
                                  onChange: (v) {
                                    if (v.isNotEmpty && v.length > 2) {
                                      Get.find<LineItemLookupController>().lookup(v);
                                    } else {
                                      Get.find<LineItemLookupController>().clearSearchResult();
                                    }
                                  },
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
                      Positioned(
                        top: 80.h,
                        child: SearchResult(formController: formController, name: 'paramsLineitemFinder'),
                      ),
                    ],
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
                            onPressed: () async {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              final formCotroller = Get.find<LineItemFormController>();
                              final lookupController = Get.find<LineItemLookupController>();
                              await controller
                                  .addLineItem(
                                workOrderId: 97,
                                invoiceId: 145,
                                lineItemId: lookupController.selectedLineItem?.id ?? 0,
                                lineItemFinder: formCotroller.formBuilder.textEditingControllers['paramsLineitemFinder']?.text ?? '',
                                unitCost: formCotroller.formBuilder.textEditingControllers['unitCost']?.text ?? '',
                                quantity: formCotroller.formBuilder.textEditingControllers['quantity']?.text ?? '',
                                discount: formCotroller.formBuilder.textEditingControllers['discount']?.text ?? '',
                                description: formCotroller.formBuilder.textEditingControllers['description']?.text ?? '',
                              )
                                  .then((value) {
                                if (value) {
                                  Get.back();
                                }
                              });
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
        ),
      );
    });
  }
}

class SearchResult extends StatelessWidget {
  const SearchResult({
    super.key,
    required this.formController,
    required this.name,
  });

  final LineItemFormController formController;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LineItemLookupController>(
      builder: (controller) {
        if (controller.loading) {
          return SizedBox(
            width: width - (AppSizes.horizontalPadding * 2),
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        return Container(
          padding: const EdgeInsets.all(8),
          height: controller.showSearchResult ? 200.h : 0,
          width: width - (AppSizes.horizontalPadding * 2),
          decoration: BoxDecoration(
            color: AppColors.white1,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: AppColors.greyText,
              width: 1,
            ),
          ),
          child: controller.showSearchResult
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.searchResult.length,
                  itemBuilder: (BuildContext context, int index) {
                    final lineItem = controller.searchResult[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${index + 1}.'),
                        Expanded(
                          child: ListTile(
                            title: Text(lineItem.name ?? ''),
                            onTap: () {
                              controller.setShowSearchResult(false);
                              controller.setSelectedLineItem(lineItem);
                              controller.clearSearchResult();
                              formController.formBuilder.textEditingControllers[name]?.text = lineItem.name ?? '';
                              formController.formBuilder.textEditingControllers['unitCost']?.text = lineItem.unitCost ?? '';
                              formController.formBuilder.textEditingControllers['quantity']?.text = '${lineItem.quantity ?? 1}';
                              formController.formBuilder.textEditingControllers['discount']?.text = '${lineItem.discount ?? 0}';
                              formController.formBuilder.textEditingControllers['description']?.text = lineItem.description ?? '';
                            },
                          ),
                        ),
                      ],
                    );
                  },
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
