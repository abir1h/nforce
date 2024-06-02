import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/contact_group_model.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/contact_group/business_manager_contact_group_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

GlobalKey<FormState> addOrEditContactGroup = GlobalKey<FormState>();

class BusinessManagerAddOrEditContactGroup extends StatefulWidget {
  const BusinessManagerAddOrEditContactGroup({
    super.key,
    this.contactGroup,
  });
  final ContactGroup? contactGroup;

  @override
  State<BusinessManagerAddOrEditContactGroup> createState() => _BusinessManagerAddOrEditCalendarViewState();
}

class _BusinessManagerAddOrEditCalendarViewState extends State<BusinessManagerAddOrEditContactGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(
        title: widget.contactGroup != null ? 'Edit Contact Group' : 'Add Contact Group',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
        child: GetBuilder<BusinessManagerContactGroupController>(
          builder: (controller) {
            return controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.formBuilder.fieldNames.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            String name = controller.formBuilder.fieldNames[index];
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
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              onPressed: () {
                                controller.saveEditOrDelete(action: ActionType.submit, id: widget.contactGroup?.id).then((value) {
                                  if (value) {
                                    Get.back();
                                  }
                                });
                              },
                              text: 'Submit',
                            ),
                          ),
                        ],
                      ),
                      30.h.vSpace,
                    ],
                  );
          },
        ),
      ),
    );
  }
}
