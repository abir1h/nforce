import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/views/calendar/business_manager_add_or_edit_calendar.dart';
import 'package:nuforce/app/modules/business_manager/views/calendar/business_manager_calendar_controller.dart';
import 'package:nuforce/app/modules/business_manager/views/calendar/business_manager_calendar_details_view.dart';
import 'package:nuforce/app/modules/business_manager/views/calendar/widget/business_manager_empty_calendar.dart';
import 'package:nuforce/app/modules/business_manager/views/calendar/widget/color_calendar_task_tile.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

class BusinessManagerCalendarView extends StatefulWidget {
  const BusinessManagerCalendarView({super.key});

  @override
  State<BusinessManagerCalendarView> createState() => _BusinessManagerCalendarViewState();
}

class _BusinessManagerCalendarViewState extends State<BusinessManagerCalendarView> {
  final controller = Get.find<BusinessManagerController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessManagerCalendarController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.white1,
          appBar: CustomAppbarMinimal(
            title: 'Calendar',
            trailing: [
              controller.businessManagerCalendarController.mockCalendar.isEmpty
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: () {
                        Get.to(() => const BusinessManagerAddOrEditCalendar());
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
                          )
                        ],
                      ),
                    ),
              const SizedBox(width: 16)
            ],
          ),
          body: SizedBox(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: controller.businessManagerCalendarController.mockCalendar.isEmpty
                  ? const EmptyCalendar()
                  : Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: ListView.builder(
                        itemCount: controller.businessManagerCalendarController.mockCalendar.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: ColoredCalendarTaskTile(
                              calendar: controller.businessManagerCalendarController.mockCalendar[index],
                              onTap: () {
                                Get.to(
                                  () => BusinessManagerCalendarDeatilsView(
                                    calendar: controller.businessManagerCalendarController.mockCalendar[index],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
