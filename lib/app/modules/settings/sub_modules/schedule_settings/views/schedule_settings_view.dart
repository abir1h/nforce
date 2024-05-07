import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_with_switch.dart';
import 'package:nuforce/app/modules/settings/sub_modules/schedule_settings/controller/schedule_settings_controller.dart';

class ScheduleSettingView extends StatefulWidget {
  const ScheduleSettingView({super.key});

  @override
  State<ScheduleSettingView> createState() => _ScheduleSettingViewState();
}

class _ScheduleSettingViewState extends State<ScheduleSettingView> {
  final ScheduleSettingController controller = Get.put(ScheduleSettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppbarMinimal(
        title: 'Schedule Settings',
        centerTitle: true,
        trailing: [],
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Obx(
            () => Column(
              children: [
                TitleWithSwitch(
                  text: 'Calendar',
                  isSwitchSelected: controller.calendarSwitch.value,
                  onSwitchChanged: (value) {
                    controller.triggerSwitch(SwitchType.calendar, value);
                  },
                ),
                SizedBox(height: 16.h),
                TitleWithSwitch(
                  text: 'Timeline',
                  isSwitchSelected: controller.timelineSwitch.value,
                  onSwitchChanged: (value) {
                    controller.triggerSwitch(SwitchType.timeline, value);
                  },
                ),
                SizedBox(height: 16.h),
                TitleWithSwitch(
                  text: 'Map',
                  isSwitchSelected: controller.mapSwitch.value,
                  onSwitchChanged: (value) {
                    controller.triggerSwitch(SwitchType.map, value);
                  },
                ),
                SizedBox(height: 32.h),
              ],
            ),
          )),
    );
  }
}
