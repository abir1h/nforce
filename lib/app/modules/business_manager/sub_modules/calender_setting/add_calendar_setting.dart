import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controllers/calender_setting_controller.dart';
import '../../models/calendar_setting_model.dart';
import 'calendar_settings_view.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../utils/text_styles.dart';
import '../regional_setting/widget/custom_button.dart';
import '../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../utils/colors.dart';

class AddCalenderSetting extends StatefulWidget {
  const AddCalenderSetting({super.key});

  @override
  State<AddCalenderSetting> createState() => _AddCalenderSettingState();
}

class _AddCalenderSettingState extends State<AddCalenderSetting> {
  final controller = Get.find<CalenderSettingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppbarMinimal(
        title: 'Regional Settings',
      ),
      body: GetBuilder<CalenderSettingController>(builder: (_) {
        return SizedBox(
          height: 1.sh,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      "Service Calendar",
                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 14.sp, color: AppColors.nutralBlack1),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: AppColors.textFieldBackground,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                      value: controller.selectedServiceCalender,
                      onChanged: (String? value) {
                        controller.setServiceCalendar(value!);
                      },
                      items: controller.serviceCalendarList.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Office Calendar",
                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 14.sp, color: AppColors.nutralBlack1),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: AppColors.textFieldBackground,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                      value: controller.selectedOfficeCalender,
                      onChanged: (String? value) {
                        controller.setOfficeCalendar(value!);
                      },
                      items: controller.officeCalendarList.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Task Duration",
                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 14.sp, color: AppColors.nutralBlack1),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      // height: 50,
                      color: AppColors.textFieldBackground,
                      child: TextFormField(
                        cursorColor: AppColors.primaryBlue1,
                        autocorrect: false,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          hintText: "Enter Display name",
                          hintStyle: CustomTextStyle.paragraphSmall.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.greyText,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.greyText,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.primaryBlue1,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onChanged: (v) {
                          controller.setTaskDuration(v);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Text(
                        "Default duration in minutes to complete scheduled task",
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp, fontFamily: "Poppins", color: AppColors.greyText),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Office Starts At",
                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 14.sp, color: AppColors.nutralBlack1),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((value) {
                          controller.setStartAt('${value!.hour}:${value.minute}');
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: AppColors.textFieldBackground,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.greyText),
                        ),
                        child: Row(
                          children: [
                            Text(
                              controller.startAt ?? 'Select date format',
                              style: TextStyle(
                                color: AppColors.nutralBlack2,
                                fontSize: 16.sp,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            SvgPicture.asset(Assets.images.svg.calendarMonth),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Office Ends At",
                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 14.sp, color: AppColors.nutralBlack1),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((value) {
                          controller.setEndAt('${value!.hour}:${value.minute}');
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: AppColors.textFieldBackground,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.greyText),
                        ),
                        child: Row(
                          children: [
                            Text(
                              controller.endAt ?? 'Select date format',
                              style: TextStyle(
                                color: AppColors.nutralBlack2,
                                fontSize: 16.sp,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            SvgPicture.asset(Assets.images.svg.calendarMonth),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Reset",
                        textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: "Poppins", color: AppColors.red),
                        borderColor: AppColors.red,
                        primaryColored: false,
                        onPressed: () {
                          controller.reset();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: CustomButton(
                        text: "Submit",
                        primaryColored: true,
                        onPressed: () {
                          controller.addRegionalSetting(CalendarSettingModel(
                              serviceCalendar: controller.selectedServiceCalender.toString(),
                              officeCalendar: controller.selectedOfficeCalender.toString(),
                              endAt: controller.endAt.toString(),
                              startAt: controller.endAt.toString(),
                              taskDuration: controller.taskDuration.toString()));
                          Get.to(const CalenderSettingView());
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24)
              ],
            ),
          ),
        );
      }),
    );
  }
}
