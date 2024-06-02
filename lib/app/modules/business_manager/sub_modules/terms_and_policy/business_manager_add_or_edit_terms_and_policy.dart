import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_terms_and_policy_controller.dart';
import 'package:nuforce/app/modules/business_manager/controllers/service_terms_edit_controller.dart';
import 'package:nuforce/app/modules/business_manager/models/service_terms_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

import '../../models/form_model.dart';

class BusinessManagerAddOrEditTermsAndPolicy extends StatefulWidget {
  const BusinessManagerAddOrEditTermsAndPolicy({
    super.key,
    this.termsAndPolicy,
  });
  final ServiceTermsModel? termsAndPolicy;

  @override
  State<BusinessManagerAddOrEditTermsAndPolicy> createState() => _BusinessManagerAddOrEditTermsAndPolicyViewState();
}

class _BusinessManagerAddOrEditTermsAndPolicyViewState extends State<BusinessManagerAddOrEditTermsAndPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(
        title: widget.termsAndPolicy != null ? 'Edit Terms And Policy' : 'Add Terms And Policy',
      ),
      body: GetBuilder<ServiceTermsEditController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
            child: GetBuilder<ServiceTermsEditController>(builder: (controller) {
              return CustomLoadingWidget(
                isLoading: controller.isLoading,
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      itemCount: controller.formBuilder.fieldNames.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
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
                    )),
                    controller.isSaving
                        ? const Center(child: CircularProgressIndicator())
                        : PrimaryButton(
                            onPressed: () {
                              if (controller.formBuilder.textEditingControllers['name']?.text.isEmpty == true) {
                                Fluttertoast.showToast(msg: 'Name is required');
                                return;
                              }

                              controller.addEditDeleteTerms(id: widget.termsAndPolicy?.id, action: ActionType.submit).then((value) {
                                if (value == true) {
                                  final data = Get.find<BusinessManagerTermsAndPolicyController>();
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
            }),
          );
        },
      ),
    );
  }
}
