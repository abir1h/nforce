import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/calendar_list_model.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/business_manager_calendar_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class BusinessManagerAddOrEditCalendar extends StatefulWidget {
  const BusinessManagerAddOrEditCalendar({
    super.key,
    this.calendar,
  });
  final CalendarData? calendar;

  @override
  State<BusinessManagerAddOrEditCalendar> createState() => _BusinessManagerAddOrEditCalendarViewState();
}

class _BusinessManagerAddOrEditCalendarViewState extends State<BusinessManagerAddOrEditCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(
        title: widget.calendar != null ? 'Edit Calendar' : 'Add New Calendar',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 15),
        child: GetBuilder<BusinessManagerCalendarController>(
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
                                controller.saveEditOrDelete(calendarId: widget.calendar?.id, action: ActionType.submit);
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
