import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/calendar/widgets/add_schedule_bottomsheet.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../shared/widgets/custom_dropdown.dart';
import '../controllers/calendar_controller.dart';
import '../widgets/view_schedule_bottomsheet.dart';

class ServiceCenterCalendarView extends GetView<ServiceCenterCalendarController> {
  const ServiceCenterCalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () => showCupertinoModalPopup<void>(
          context: context,
          builder: (context) => const AddScheduleBottoMSheet(),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
          decoration: BoxDecoration(color: AppColors.primaryBlue1, borderRadius: BorderRadius.circular(4.r)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
                size: 24.r,
              ),
              Text(
                'Add Schedule',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: isIpad ? 12.sp : 16.sp,
                  color: AppColors.white1,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        child: Column(
          children: [
            // First Row
            Row(
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(color: AppColors.greyStrokColor),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.images.svg.fullScreen,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Full View',
                          style: CustomTextStyle.paragraphExtraSmall.copyWith(
                            color: AppColors.nutralBlack1,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(color: AppColors.greyStrokColor),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.images.svg.timechart,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Time Chart',
                          style: CustomTextStyle.paragraphExtraSmall.copyWith(
                            color: AppColors.nutralBlack1,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(color: AppColors.greyStrokColor),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.images.svg.timeline,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Daily Timeline',
                          style: CustomTextStyle.paragraphExtraSmall.copyWith(
                            color: AppColors.nutralBlack1,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Row(
              children: [
                Flexible(
                  child: CustomDropdownButton(
                    items: [
                      DropdownMenuItem(
                        value: 'producttypex',
                        child: Text(
                          'Sort By Agent',
                          style: CustomTextStyle.paragraphExtraSmall.copyWith(
                            color: AppColors.nutralBlack1,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'producttypey',
                        child: Text(
                          'Sort By Customer',
                          style: CustomTextStyle.paragraphExtraSmall.copyWith(
                            color: AppColors.nutralBlack1,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                    hint: 'Sort by agent',
                    onChanged: (v) {},
                    value: 'producttypex',
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: CustomDropdownButton(
                    items: [
                      DropdownMenuItem(
                        value: 'producttypex',
                        child: Text(
                          'Sort By Region',
                          style: CustomTextStyle.paragraphExtraSmall.copyWith(
                            color: AppColors.nutralBlack1,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'producttypey',
                        child: Text(
                          'Sort By Region1',
                          style: CustomTextStyle.paragraphExtraSmall.copyWith(
                            color: AppColors.nutralBlack1,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                    hint: 'Sort By Region',
                    onChanged: (v) {},
                    value: 'producttypex',
                  ),
                ),
              ],
            ),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              calendarStyle: const CalendarStyle(outsideDaysVisible: false),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              selectedDayPredicate: (day) {
                // Use `selectedDayPredicate` to determine which day is currently selected.
                // If this returns true, then `day` will be marked as selected.
                return isSameDay(DateTime.now(), day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                showCupertinoModalPopup<void>(
                  context: context,
                  builder: (context) => const ViewScheduleBottomsheet(),
                );
              },
              onPageChanged: (focusedDay) {},
              calendarBuilders: CalendarBuilders(
                outsideBuilder: (context, date, events) {
                  return Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: CustomTextStyle.paragraphExtraSmall.copyWith(
                          color: AppColors.greyText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                },
                selectedBuilder: (context, date, _) {
                  return Container(
                    margin: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: CustomTextStyle.paragraphExtraSmall.copyWith(
                          color: AppColors.white1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ).ifIpad,
      ),
    );
  }
}
