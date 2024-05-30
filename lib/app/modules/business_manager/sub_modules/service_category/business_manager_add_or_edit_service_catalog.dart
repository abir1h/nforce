import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/service_category/business_manager_service_catalog_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/main.dart';

import '../../../../utils/app_states.dart';
import '../../controllers/service_category_edit_controller.dart';
import '../../models/form_model.dart';

GlobalKey<FormState> addOrEditServiceCategory = GlobalKey<FormState>();

class BusinessManagerAddOrEditServiceCatalogs extends StatefulWidget {
  const BusinessManagerAddOrEditServiceCatalogs({
    super.key,
    this.serviceCatalog,
  });
  final MockServiceCatalog? serviceCatalog;

  @override
  State<BusinessManagerAddOrEditServiceCatalogs> createState() =>
      _BusinessManagerAddOrEditServiceCatalogsState();
}

class _BusinessManagerAddOrEditServiceCatalogsState
    extends State<BusinessManagerAddOrEditServiceCatalogs> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final controller = Get.put(ServiceCategoryEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         resizeToAvoidBottomInset: false,
        appBar: CustomAppbarMinimal(
          title: widget.serviceCatalog != null ? 'Edit Catalog' : 'Add Catalog',
        ),
        body: GetBuilder<ServiceCategoryEditController>(builder: (controller) {
          return controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.horizontalPadding),
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                        itemCount: controller.formBuilder.fieldNames.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final name = controller.formBuilder.fieldNames[index];
                          Widget? widget = controller.formBuilder.widgets[name];
                          if (widget != null &&
                              widget.runtimeType ==
                                  CustomDropdownButton<Option?>) {
                            widget = (widget as CustomDropdownButton<Option?>)
                                .copyWith(
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
                      )),
                      controller.isSaving
                          ? const Center(child: CircularProgressIndicator())
                          : PrimaryButton(
                              onPressed: () {
                                // controller.addCategory();
                                 final controller = Get.find<ServiceCategoryEditController>();


                                 List checks = [
                                   {'field': controller.formBuilder.textEditingControllers['name']?.text, 'message': 'Name is required'},
                                   {'field': controller.formBuilder.textEditingControllers['refCode']?.text, 'message': 'RefCode is required'},
                                   {'field': '${controller.formBuilder.dropdownValue['parentId']?.value ?? ''}', 'message': 'ParentId is required'},
                                   {'field': controller.formBuilder.textEditingControllers['description']?.text, 'message': 'Description is required'},
                                   {'field': controller.formBuilder.textEditingControllers['detailsGoogleTaxonomyId']?.text, 'message': 'Details Google Taxonomy Id is required'},
                                   {'field': controller.formBuilder.textEditingControllers['displayOrder']?.text, 'message': 'Display Order is required'},
                                   {'field': '${controller.formBuilder.dropdownValue['policyIds']?.value ?? ''}', 'message': 'PolicyIds is required'},
                                   {'field': controller.formBuilder.stringTagControllers['tags']!.getTags!.isEmpty == false ? 'valid' : '', 'message': 'Tags are required'},
                                 ];

                                 // Iterate over the checks and show a toast if any field is empty
                                 for (var check in checks) {
                                   if (check['field']?.isEmpty == true) {
                                     Fluttertoast.showToast(msg: check['message']);
                                     return;
                                   }else{
                                    controller.addCategory().then((value) {
                                      if (value == true) {
                                        print('success>>>>>>');
                                        Get.back();
                                      }
                                    });
                                   }
                                 }


                   /* controller.addNote(detailValue: controller.formBuilder.textEditingControllers['detailValue']!.text).then((value) {
                      if (value == true) {
                        final invoiceController = Get.find<InvoiceController>();
                        invoiceController.getNotes();
                        Get.back();
                      }
                    });*/
                              },
                              text: 'Save',
                            ),
                      30.h.vSpace,
                    ],
                  ),
                );
        }));
  }
}
