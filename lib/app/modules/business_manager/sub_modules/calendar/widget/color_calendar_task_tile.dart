import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/business_manager_calendar_controller.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class ColoredCalendarTaskTile extends StatelessWidget {
  const ColoredCalendarTaskTile({
    super.key,
    required this.calendar,
    this.onTap,
  });

  final MockCalendar calendar;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.textFieldBackground,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.white3),
        ),
        child: Row(
          children: [
            Container(
              width: 5.w,
              constraints: const BoxConstraints(minHeight: 70),
              decoration: BoxDecoration(
                color: calendar.color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  bottomLeft: Radius.circular(6),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    calendar.name,
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    calendar.timeZone ?? '',
                    style: TextStyle(
                      color: AppColors.subText,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(
                Assets.images.svg.arrowRight,
                height: 16.sp,
                width: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}