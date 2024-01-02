import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/calender_setting_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calender_setting/add_calendar_setting.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/regional_setting/widget/custom_button.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/regional_setting/widget/custom_text_block.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class CalenderSettingView extends StatefulWidget {
  const CalenderSettingView({super.key});

  @override
  State<CalenderSettingView> createState() => _CalenderSettingViewState();
}

class _CalenderSettingViewState extends State<CalenderSettingView> {
  final controller = Get.find<CalenderSettingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: 'Calendar Settings',
      ),
      body: GetBuilder<CalenderSettingController>(
        builder: (_) {
          return controller.calendarSettingData != null
              ? SizedBox(
                  height: 1.sh,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 16.w, top: 16.h, bottom: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextBlock(
                                label: 'Service Calendar',
                                value: controller.calendarSettingData?.serviceCalendar ?? 'N/A',
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              CustomTextBlock(
                                label: 'Office Calendar',
                                value: controller.calendarSettingData?.officeCalendar ?? 'N/A',
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              CustomTextBlock(
                                label: 'Task Duration',
                                value: controller.calendarSettingData?.taskDuration == 'null' ? controller.calendarSettingData!.taskDuration : 'N/A',
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              CustomTextBlock(
                                label: 'Office Starts At',
                                value: controller.calendarSettingData?.startAt ?? 'N/A',
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              CustomTextBlock(
                                label: 'Office Ends At',
                                value: controller.calendarSettingData?.endAt ?? 'N/A',
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                text: 'Delete',
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: AppColors.red,
                                ),
                                borderColor: AppColors.red,
                                primaryColored: false,
                                onPressed: controller.delete,
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Expanded(
                              child: CustomButton(
                                text: 'Edit',
                                onPressed: () {
                                  Get.to<void>(const AddCalenderSetting());
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 44.w),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            Assets.images.svg.empty,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              'Empty Data',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: AppColors.nutralBlack2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 24.h, left: 20.w, right: 20.w),
                      child: PrimaryButton(
                        onPressed: () {
                          Get.to<void>(const AddCalenderSetting());
                        },
                        text: 'Add Calendar Settings',
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
