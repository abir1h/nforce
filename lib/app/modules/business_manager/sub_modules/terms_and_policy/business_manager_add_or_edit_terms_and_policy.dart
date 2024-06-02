import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_terms_and_policy_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/service_terms_edit_controller.dart';
import 'package:nuforce/app/modules/business_manager/models/service_terms_model.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/main.dart';

import '../../models/form_model.dart';

GlobalKey<FormState> addOrEditTermsAndPolicy = GlobalKey<FormState>();

class BusinessManagerAddOrEditTermsAndPolicy extends StatefulWidget {
  const BusinessManagerAddOrEditTermsAndPolicy({
    super.key,
    this.termsAndPolicy,
  });
  final ServiceTermsModel? termsAndPolicy;

  @override
  State<BusinessManagerAddOrEditTermsAndPolicy> createState() =>
      _BusinessManagerAddOrEditTermsAndPolicyViewState();
}

class _BusinessManagerAddOrEditTermsAndPolicyViewState
    extends State<BusinessManagerAddOrEditTermsAndPolicy> {
  final controller = Get.put(ServiceTermsEditController());

  @override
  void initState() {
    super.initState();
    if (widget.termsAndPolicy != null) {
      controller.setTermsForm(widget.termsAndPolicy!.id);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbarMinimal(
          title: widget.termsAndPolicy != null
              ? 'Edit Terms And Policy'
              : 'Add Terms And Policy',
        ),
        body: GetBuilder<ServiceTermsEditController>(builder: (controller) {
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

                                if (controller
                                        .formBuilder
                                        .textEditingControllers['name']
                                        ?.text
                                        .isEmpty ==
                                    true) {
                                  Fluttertoast.showToast(
                                      msg: 'Name is required');
                                  return;
                                }

                                controller.addTerms(widget.termsAndPolicy?.id).then((value) {
                                  if (value == true) {
                                    print('success>>>>>>');
                                    final data = Get.find<
                                        BusinessManagerTermsAndPolicyController>();
                                    data.getServiceTerms();
                                    Get.back();
                                  }
                                });
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
