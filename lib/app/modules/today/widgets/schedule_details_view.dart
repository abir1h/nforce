import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/today/controllers/today_controller.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/datetime_custom_func.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class ScheduleDetailsView extends StatelessWidget {
  const ScheduleDetailsView({
    super.key,
    required this.eventChild,
  });
  final EventChild eventChild;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.h.vSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.close, color: Colors.transparent),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    DatetimeCustomFunc.getFormattedDateWithMonth(eventChild.date),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${DatetimeCustomFunc.getDayName(eventChild.date)} - ${DatetimeCustomFunc.getFormattedTime(eventChild.startsAt)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.nutralBlack2,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: AppColors.nutralBlack1,
                ),
              ),
            ],
          ),
          24.h.vSpace,
          Text(
            eventChild.title,
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          8.h.vSpace,
          Text(
            eventChild.description,
            style: TextStyle(
              color: AppColors.subText,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          16.h.vSpace,
          Text(
            'Assigned Agent',
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          8.h.vSpace,
          Text(
            eventChild.assignedTo,
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          16.h.vSpace,
          Text(
            'Date',
            style: TextStyle(
              color: AppColors.subText,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          8.h.vSpace,
          Text(
            DatetimeCustomFunc.getFormattedDateWithMonth(eventChild.date),
            style: TextStyle(
              color: AppColors.subText,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          16.h.vSpace,
          Row(
            children: [
              _titleSubtitle('Start at', DatetimeCustomFunc.getFormattedTime(eventChild.startsAt)),
              40.w.hSpace,
              _titleSubtitle('End at', DatetimeCustomFunc.getFormattedTime(eventChild.endsAt)),
            ],
          ),
          16.h.vSpace,
          Row(
            children: [
              Expanded(
                child: SecondaryButton(
                  onPressed: () {},
                  text: 'Delete',
                ),
              ),
              10.w.hSpace,
              Expanded(
                child: PrimaryButton(
                  onPressed: () {},
                  text: 'Edit',
                ),
              ),
            ],
          ),
          50.h.vSpace,
        ],
      ),
    );
  }

  Column _titleSubtitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.subText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        8.h.vSpace,
        Text(
          subtitle,
          style: TextStyle(
            color: AppColors.subText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
