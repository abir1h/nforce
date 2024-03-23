import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../utils/colors.dart';
import '../widgets/allday_event_bottomsheet.dart';
import '../widgets/calendar_sync_card.dart';
import '../widgets/events_bottomsheet.dart';

class AlertSettings extends StatelessWidget {
  const AlertSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppbarMinimal(
        title: 'Alert Settings',
        centerTitle: true,
        trailing: [],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          children: [
            CalendarSyncCard(
              title: "Events",
              subtitile: '10 mins before',
              onTap: () {
                showCupertinoModalPopup<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => const EventBottomsheeet(),
                );
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            CalendarSyncCard(
              title: "All-day events",
              subtitile: 'Day before event at 5:00PM',
              onTap: () { showCupertinoModalPopup<void>(
                context: context,
                barrierDismissible: true,
                builder: (context) => const AlldayEventBottomsheet(),
              );},
            ),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    );
  }
}
