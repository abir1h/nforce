import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/label_model.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/label/business_manager_label_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

GlobalKey<FormState> addOrEditLabel = GlobalKey<FormState>();

class BusinessManagerAddOrEditLabel extends StatefulWidget {
  const BusinessManagerAddOrEditLabel({
    super.key,
    this.label,
  });
  final Label? label;

  @override
  State<BusinessManagerAddOrEditLabel> createState() => _BusinessManagerAddOrEditCalendarViewState();
}

class _BusinessManagerAddOrEditCalendarViewState extends State<BusinessManagerAddOrEditLabel> {
  String? name;
  String? type;
  String? color;
  String? description;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(
        title: widget.label != null ? 'Edit Label' : 'Add Label',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 15),
        child: GetBuilder<BusinessManagerLabelController>(
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
                                // controller.saveEditOrDelete(calendarId: widget.calendar?.id, action: ActionType.submit);
                                controller.saveEditOrDelete(action: ActionType.submit, id: widget.label?.id).then((value) {
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
