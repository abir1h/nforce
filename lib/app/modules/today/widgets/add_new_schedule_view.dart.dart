import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/shared/widgets/custom_date_field.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/custom_time_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class AddNewScheduleView extends StatefulWidget {
  const AddNewScheduleView({super.key});

  @override
  State<AddNewScheduleView> createState() => _AddNewScheduleViewState();
}

class _AddNewScheduleViewState extends State<AddNewScheduleView> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Row(
            children: [
              Text(
                'Add New Schedule',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close),
              ),
            ],
          ),
        ),
        const Divider(color: AppColors.greyText),
        15.h.vSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const CustomTextField(
                label: 'Schedule Name*',
                hint: 'AC Fixing Service',
                controller: null,
              ),
              15.h.vSpace,
              const CustomDateField(label: 'Date'),
              15.h.vSpace,
              Row(
                children: [
                  const Expanded(
                    child: CustomTimeField(
                      label: 'Start at',
                    ),
                  ),
                  10.w.hSpace,
                  const Expanded(
                    child: CustomTimeField(
                      label: 'End at',
                    ),
                  ),
                ],
              ),
              15.h.vSpace,
              const CustomTextField(
                label: 'Schedule Note',
                hint: 'Write your note here...',
                controller: null,
                maxLines: 3,
              ),
              15.h.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Remind me',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CupertinoSwitch(
                    value: switchValue,
                    onChanged: (v) {
                      setState(() {
                        switchValue = v;
                      });
                    },
                    activeColor: AppColors.primaryBlue1,
                  ),
                ],
              ),
              40.h.vSpace,
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {},
                      text: 'Reset',
                    ),
                  ),
                  10.w.hSpace,
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {},
                      text: 'Save',
                    ),
                  ),
                ],
              ),
              40.h.vSpace,
            ],
          ),
        ),
      ],
    );
  }
}
