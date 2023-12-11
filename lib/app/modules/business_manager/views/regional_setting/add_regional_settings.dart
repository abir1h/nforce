import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/regional_setting.dart';
import 'regional_settings.dart';
import '../../controllers/regional_settings_controller.dart';
import '../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../utils/colors.dart';
import 'widget/custom_button.dart';

class AddRegionalSettings extends StatefulWidget {
  const AddRegionalSettings({super.key});

  @override
  State<AddRegionalSettings> createState() => _AddRegionalSettingsState();
}

class _AddRegionalSettingsState extends State<AddRegionalSettings> {
  final controller = Get.find<RegionalSettingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: 'Regional Settings',
      ),
      body: GetBuilder<RegionalSettingController>(builder: (_) {
        return SizedBox(
          height: 1.sh,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Country",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              fontSize: 14.sp,
                              color: AppColors.nutralBlack1),
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
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                          borderRadius: BorderRadius.circular(6.r),
                          value: controller.selectedDropdownValue,
                          onChanged: (String? value) {
                            controller.setCountry(value!);
                          },
                          items: controller.countries.map((item) {
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
                          "Time Zone",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              fontSize: 14.sp,
                              color: AppColors.nutralBlack1),
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
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                          borderRadius: BorderRadius.circular(6.r),
                          value: controller.selectedTimeZoneDropdownValue,
                          onChanged: (String? value) {
                            controller.setTimezone(value!);
                          },
                          items: controller.timezones.map((item) {
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
                          "Date Format",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              fontSize: 14.sp,
                              color: AppColors.nutralBlack1),
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
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                          borderRadius: BorderRadius.circular(6.r),
                          value: controller.selectedDateFormat,
                          onChanged: (String? value) {
                            controller.setDateFormat(value!);
                          },
                          items: controller.dateFormats.map((item) {
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
                          "Time Format",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              fontSize: 14.sp,
                              color: AppColors.nutralBlack1),
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
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                          borderRadius: BorderRadius.circular(6.r),
                          value: controller.selectedTimeFormat,
                          onChanged: (String? value) {
                            controller.setTime(value!);
                          },
                          items: controller.TimeFormateList.map((item) {
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
                          "First Day of week",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              fontSize: 14.sp,
                              color: AppColors.nutralBlack1),
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
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                          borderRadius: BorderRadius.circular(6.r),
                          value: controller.selectedDay,
                          onChanged: (String? value) {
                            controller.setDay(value!);
                          },
                          items: controller.daysOfWeek.map((item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                        ),
                      ]),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Reset",
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            fontFamily: "Poppins",
                            color: AppColors.red),
                        borderColor: AppColors.red,
                        primaryColored: false,
                        onPressed: () {},
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
                          controller.addRegionalSetting(RegionalSettingModel(
                              country:
                                  controller.selectedDropdownValue.toString(),
                              timeZone: controller.selectedTimeZoneDropdownValue
                                  .toString(),
                              dateFormat:
                                  controller.selectedDateFormat.toString(),
                              timeFormat:
                                  controller.selectedTimeFormat.toString(),
                              firstDayOfWeek:
                                  controller.selectedDay.toString()));
                          Get.to(const RegionalSettings());
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
