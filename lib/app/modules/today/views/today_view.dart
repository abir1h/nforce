import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/today/controllers/today_controller.dart';
import 'package:nuforce/app/modules/today/widgets/map_button.dart';
import 'package:nuforce/app/modules/today/widgets/schedule_tile_for_todayview.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/datetime_custom_func.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/gen/assets.gen.dart';
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

  final ExpandableController expandableController = ExpandableController();

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

  MockEvents? selectedEvents;

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
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                child: TableCalendar<MockEvents>(
                  onDaySelected: (v1, v2) {
                    setState(() {
                      selectedEvents = mockEvents.firstWhereOrNull((element) => isSameDay(element.date, v1));
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
              ),
              16.h.vSpace,
              if (selectedDate != null && selectedEvents != null)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white1,
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.white3),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Schedule 0f ${DatetimeCustomFunc.getFormattedDateWithMonth(selectedDate!)}',
                                style: TextStyle(
                                  color: AppColors.nutralBlack1,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              MapButton(onTap: () {}),
                            ],
                          ),
                        ),
                        const Divider(color: AppColors.white3),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: SizedBox(
                              width: width - 32 - 40,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      color: AppColors.primaryBlue1,
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  Expanded(
                                    child: ExpandablePanel(
                                      controller: expandableController,
                                      theme: const ExpandableThemeData(
                                        crossFadePoint: 0,
                                        hasIcon: false,
                                        iconColor: AppColors.nutralBlack1,
                                        iconSize: 0,
                                        iconPadding: EdgeInsets.only(right: 16),
                                        animationDuration: Duration(milliseconds: 300),
                                        expandIcon: Icons.keyboard_arrow_down,
                                        collapseIcon: Icons.keyboard_arrow_up,
                                        tapBodyToCollapse: true,
                                        tapBodyToExpand: true,
                                        tapHeaderToExpand: true,
                                        iconRotationAngle: 0,
                                        alignment: Alignment.topLeft,
                                      ),
                                      header: Padding(
                                        padding: const EdgeInsets.only(bottom: 12),
                                        child: ScheduleTileForTodayView(
                                          eventChild: selectedEvents!.eventChild[0],
                                        ),
                                      ),
                                      collapsed: const SizedBox(),
                                      expanded: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: selectedEvents!.eventChild.length - 1,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom: 12),
                                            child: ScheduleTileForTodayView(
                                              eventChild: selectedEvents!.eventChild[index + 1],
                                            ),
                                            // child: TaskTileWithCheckbox(
                                            //   mockTaskApi: controller.mockTaskApiList[index + 1],
                                            //   onChanged: (value) {
                                            //     controller.updateMockApi(index + 1, value!);
                                            //   },
                                            // ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
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
