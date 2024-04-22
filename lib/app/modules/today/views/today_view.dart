import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/today/controllers/today_controller.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';
import 'package:table_calendar/table_calendar.dart';

class TodayView extends StatefulWidget {
  const TodayView({super.key});

  @override
  State<TodayView> createState() => _TodayViewState();
}

class _TodayViewState extends State<TodayView> {
  DateTime? selectedDate;
  late final TodayController todayController;

  @override
  void initState() {
    super.initState();
    todayController = Get.put(TodayController());
  }

  @override
  void dispose() {
    todayController.dispose();
    Get.delete<TodayController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Today',
          style: TextStyle(
            fontSize: 18.sp,
            color: AppColors.nutralBlack1,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: AppColors.white1,
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
        width: width,
        height: height,
        child: Column(
          children: [
            TableCalendar<MockEvents>(
              onDaySelected: (v1, v2) {
                setState(() {
                  selectedDate = v1;
                });
              },
              focusedDay: selectedDate ?? DateTime(2024, 2, 9),
              firstDay: DateTime(2024, 2, 1),
              lastDay: DateTime(2024, 2, 29),
              headerStyle: _calendarHeaderStyle(),
              weekendDays: const [],
              daysOfWeekHeight: 40.h,
              daysOfWeekStyle: _daysOfWeekStyle(),
              rowHeight: 60.h,
              selectedDayPredicate: (day) {
                return isSameDay(selectedDate ?? DateTime(2024, 2, 9), day);
              },
              calendarStyle: _calendarStyle(),
              eventLoader: (day) {
                return mockEvents.where((element) => isSameDay(element.date, day)).toList();
              },
            ),
          ],
        ),
      ),
    );
  }

  CalendarStyle _calendarStyle() {
    return CalendarStyle(
      todayDecoration: const BoxDecoration(
        color: AppColors.red,
        shape: BoxShape.circle,
      ),
      todayTextStyle: const TextStyle(
        color: AppColors.white1,
        fontWeight: FontWeight.w600,
      ),
      defaultTextStyle: const TextStyle(
        color: AppColors.nutralBlack1,
        fontWeight: FontWeight.w600,
      ),
      disabledTextStyle: const TextStyle(
        color: Colors.transparent,
      ),
      cellPadding: EdgeInsets.only(
        bottom: 15.h,
      ),
      markerSize: 15.r,
      markersAnchor: 0.9,
      markerDecoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryBlue1,
      ),
      selectedTextStyle: const TextStyle(
        color: AppColors.primaryBlue1,
        fontWeight: FontWeight.w600,
      ),
      selectedDecoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.white1,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: AppColors.primaryBlue1,
        ),
      ),
      defaultDecoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.white1,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: AppColors.tableBorder,
        ),
      ),
    );
  }

  DaysOfWeekStyle _daysOfWeekStyle() {
    return const DaysOfWeekStyle(
      weekdayStyle: TextStyle(
        color: AppColors.subText,
        fontWeight: FontWeight.w600,
      ),
      weekendStyle: TextStyle(
        color: AppColors.subText,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  HeaderStyle _calendarHeaderStyle() {
    return HeaderStyle(
      titleCentered: true,
      formatButtonVisible: false,
      leftChevronIcon: const Icon(
        Icons.arrow_back_ios,
        color: AppColors.nutralBlack1,
      ),
      rightChevronIcon: const Icon(
        Icons.arrow_forward_ios,
        color: AppColors.nutralBlack1,
      ),
      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        color: AppColors.nutralBlack1,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
