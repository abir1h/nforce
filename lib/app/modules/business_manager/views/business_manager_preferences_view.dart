import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/estimation_setting/estimation_settings_view.dart';
import '../sub_modules/calender_setting/calendar_settings_view.dart';
import '../sub_modules/regional_setting/widget/custom_tile.dart';
import '../sub_modules/regional_setting/regional_settings_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../utils/colors.dart';

class BusinessManagerPreferences extends StatelessWidget {
  const BusinessManagerPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: 'Preferences',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Find the settings by sections below.",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomTile(
              onTap: ()=>Get.to(const RegionalSettingsView()),
              lable: "Regional Settings",
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTile(
              onTap: ()=>Get.to(const CalenderSettingView()),


              lable: "Calendar Settings",
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTile(
              onTap: ()=>Get.to(const EstimationSettingView()),

              lable: "Estimation Settings",
            ),
          ],
        ),
      ),
    );
  }
}
