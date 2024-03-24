import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/calendar_sync/widgets/alternate_calendar_bottomsheet.dart';
import 'package:nuforce/app/modules/settings/sub_modules/calendar_sync/widgets/timezone_bottomsheet.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/text_styles.dart';
import '../../../../business_manager/sub_modules/regional_setting/widget/custom_tile.dart';
import '../../../../service_items/widgets/title_with_switch.dart';
import '../widgets/calendar_sync_card.dart';
import 'alert_settings.dart';

class CalendarSyncView extends StatefulWidget {
  const CalendarSyncView({super.key});

  @override
  State<CalendarSyncView> createState() => _CalendarSyncViewState();
}

class _CalendarSyncViewState extends State<CalendarSyncView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppbarMinimal(
        title: 'Calendar Sync',
        trailing: [],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          children: [
            PopupMenuButton(
              onSelected: (value) {
                // Handle the selected value here
              },
              itemBuilder: (context) => popupMenuItems,
              child: const CalendarSyncCard(
                title: "First day of the week",
                subtitile: 'Local Default',
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CalendarSyncCard(
              title: "Alternate Calendar",
              subtitile: 'None',
              onTap: () {
                showCupertinoModalPopup<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => const AlternateCalendarBottomSheet(),
                );
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            TitleWithSwitch(
              text: 'Show Week Sumbers',
              isSwitchSelected: true,
              onSwitchChanged: (v) {},
            ),
            SizedBox(
              height: 16.h,
            ),
            TitleWithSwitch(
              text: 'Hide declined enents',
              isSwitchSelected: true,
              onSwitchChanged: (v) {},
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTile(
              onTap: () {
                Get.to(() => const AlertSettings());
              },
              lable: 'Alert Settings',
              hasTraillingIcon: false,
            ),
            SizedBox(
              height: 16.h,
            ),
            TitleWithSwitch(
              text: 'Sync All Event',
              isSwitchSelected: true,
              onSwitchChanged: (v) {},
            ),
            SizedBox(
              height: 16.h,
            ),
            CalendarSyncCard(
              title: "Time zone",
              subtitile: '(GMT +6.00) United states ',
              onTap: () {
                showCupertinoModalPopup<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => const TimeZoneBottomSheet(),
                );
              },
            ),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    );
  }

  List<PopupMenuEntry<int>> popupMenuItems = [
    PopupMenuItem<int>(
      value: 1,
      child: Text(
        'Local Default',
        style: CustomTextStyle.paragraphExtraSmall.copyWith(
          color: AppColors.subText,
        ),
      ),
    ),
    PopupMenuItem<int>(
      value: 2,
      child: Text(
        'Satureday',
        style: CustomTextStyle.paragraphExtraSmall.copyWith(
          color: AppColors.subText,
        ),
      ),
    ),
    PopupMenuItem<int>(
      value: 3,
      child: Text(
        'Sunday',
        style: CustomTextStyle.paragraphExtraSmall.copyWith(
          color: AppColors.subText,
        ),
      ),
    ),
    PopupMenuItem<int>(
      value: 4,
      child: Text(
        'Monday',
        style: CustomTextStyle.paragraphExtraSmall.copyWith(
          color: AppColors.subText,
        ),
      ),
    ),
  ];
}
