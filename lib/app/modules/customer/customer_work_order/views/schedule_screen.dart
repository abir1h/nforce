import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/views/schedule_calendar_screen.dart';
import 'package:nuforce/app/modules/settings/widgets/text_card.dart';
import '../../widgets/rounded_tabs.dart';
import '../controllers/customer_work_order_controller.dart';
import 'view_invoice_screen.dart';
import '../../../../utils/text_styles.dart';
import '../../../../utils/app_sizes.dart';
import '../../../../utils/colors.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/controllers/customer_work_order_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_tabbar_filled.dart';
import 'package:nuforce/main.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({
    super.key,
  });
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerWorkOrderController>(
      builder: (controller) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Schedules List",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            fontFamily: "poppins",
                            color: AppColors.nutralBlack1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const ScheduleCard(),
                  SizedBox(
                    height: 16.h,
                  ),
                  const ScheduleCard(),
                  SizedBox(
                    height: 16.h,
                  ),
                  const ScheduleCard(),
                  SizedBox(
                    height: 16.h,
                  ),

                ],
              ),
            ),
            Tabs(),
            SizedBox(
              height: 16.h,
            ),
            controller.tabEnumSchedule==SchedulesTabEnum.calendar?ScheduleCalendarScreen():Container(),


            SizedBox(
              height: 32.h,
            ),
          ],
        );
      },
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.white,
            border: Border.all(color: AppColors.white2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Online Courses Mobile app ui kit",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          fontFamily: "poppins",
                          color: AppColors.nutralBlack1),
                    ),
                    Text(
                      "Aug 31, 2023",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          fontFamily: "poppins",
                          color: AppColors.nutralBlack2),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.blue,
                      ),
                      child: Text(
                        "06:45 AM - 31 Aug 10:45 AM",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            fontFamily: "Poppins",
                            color: Colors.white),
                      ),
                    )
                  ],
                )),
                const Icon(Icons.more_vert_outlined)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  void initState() {
    super.initState();
    if (!CustomerWorkOrderController().initialized) {
      Get.put(CustomerWorkOrderController());
    } else {
      Get.find<CustomerWorkOrderController>();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerWorkOrderController>(
      builder: (controller) {
        return SizedBox(
          width: width,
          child: Row(
            children: [
              Expanded(
                child: RoundedTabs(
                  isSelected: controller.tabEnumSchedule == SchedulesTabEnum.calendar,
                  onTap: () {
                    controller.updateScheduleTabEnum(SchedulesTabEnum.calendar);
                  },
                  text: 'Calendar',
                  isTopLeftCurved: true,                isTopRightCurved: false,
                
                ),
              ),
               Expanded(
                 child: RoundedTabs(
                  isSelected: controller.tabEnumSchedule == SchedulesTabEnum.timeline,
                  onTap: () {
                    controller.updateScheduleTabEnum(SchedulesTabEnum.timeline);
                  },
                  text: 'Timeline',
                  isTopRightCurved: false,
                  isTopLeftCurved: false,
                               ),
               ),
              Expanded(
                child: RoundedTabs(
                  isSelected: controller.tabEnumSchedule == SchedulesTabEnum.map,
                  onTap: () {
                    controller.updateScheduleTabEnum(SchedulesTabEnum.map);
                  },
                  text: 'Map',
                  isTopLeftCurved: false,
                  isTopRightCurved: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
