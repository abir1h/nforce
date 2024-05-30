import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/business_manager_add_or_edit_calendar.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/business_manager_calendar_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/business_manager_calendar_details_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/widget/business_manager_empty_calendar.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/widget/color_calendar_task_tile.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class BusinessManagerCalendarView extends StatefulWidget {
  const BusinessManagerCalendarView({super.key});

  @override
  State<BusinessManagerCalendarView> createState() => _BusinessManagerCalendarViewState();
}

class _BusinessManagerCalendarViewState extends State<BusinessManagerCalendarView> {
  final controller = Get.put(BusinessManagerCalendarController());

  @override
  void initState() {
    super.initState();
    controller.getCalendarList();
  }

  @override
  void dispose() {
    Get.delete<BusinessManagerCalendarController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: CustomAppbarMinimal(
        title: 'Calendar',
        trailing: [
          GetBuilder<BusinessManagerCalendarController>(
            builder: (controller) {
              if (controller.calendarData.isEmpty) {
                return const SizedBox();
              } else {
                return GestureDetector(
                  onTap: () async {
                    await controller.setContactForm();
                    Get.to<void>(() => const BusinessManagerAddOrEditCalendar());
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add, color: AppColors.primaryBlue1, size: 16.sp),
                      const SizedBox(width: 8),
                      Text(
                        'Add New',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: AppColors.primaryBlue1,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          20.w.hSpace,
        ],
      ),
      body: SizedBox(
        width: Get.width,
        child: GetBuilder<BusinessManagerCalendarController>(
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: controller.calendarData.isEmpty
                  ? const EmptyCalendar()
                  : Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: ListView.builder(
                        itemCount: controller.calendarData.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: ColoredCalendarTaskTile(
                              calendar: controller.calendarData[index],
                              onTap: () {
                                Get.to<void>(
                                  () => BusinessManagerCalendarDetailsView(
                                    calendar: controller.calendarData[index],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
