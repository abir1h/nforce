import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/widgets/big_button_with_icon.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/calendar/widgets/add_schedule_bottomsheet.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../shared/widgets/custom_dropdown.dart';
import '../controllers/calendar_controller.dart';
import '../widgets/view_schedule_bottomsheet.dart';

class ServiceCenterCalendarView
    extends GetView<ServiceCenterCalendarController> {
  const ServiceCenterCalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: ()=> showCupertinoModalPopup<void>(
          context: context,
          builder: (context) => const AddScheduleBottoMSheet(),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
          decoration: BoxDecoration(
              color: AppColors.primaryBlue1,
              borderRadius: BorderRadius.circular(4.r)),
          child: Row(mainAxisSize: MainAxisSize.min,
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
                    fontSize: 16.sp,
                    color: AppColors.white1),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
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
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            fontFamily: "Poppins",
                            color: AppColors.nutralBlack1,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
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
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            fontFamily: "Poppins",
                            color: AppColors.nutralBlack1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 12.h),
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
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            fontFamily: "Poppins",
                            color: AppColors.nutralBlack1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
            Row(
              children: [
                Flexible(
                  child: CustomDropdownButton(
                    items: [
                      DropdownMenuItem(
                        value: 'producttypex',
                        child: Text(
                          'Sort By Agent',
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'producttypey',
                        child: Text(
                          'Sort By Customer',
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            fontSize: 13.sp,
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
                SizedBox(width: 8),
                Flexible(
                  child: CustomDropdownButton(
                    items: [
                      DropdownMenuItem(
                        value: 'producttypex',
                        child: Text(
                          'Sort By Region',
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'producttypey',
                        child: Text(
                          'Sort By Region1',
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            fontSize: 13.sp,
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
              lastDay: DateTime.utc(2030, 12, 31),calendarStyle: CalendarStyle(
                outsideDaysVisible:false
            ),
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
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                },
                selectedBuilder: (context, date, _) {
                  return Container(
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
