import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/calendar/controllers/calendar_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../../../../../shared/widgets/secondary_button.dart';
import '../../../../../utils/text_styles.dart';

class AddScheduleBottoMSheet extends StatefulWidget {
  const AddScheduleBottoMSheet({
    super.key,
  });

  @override
  State<AddScheduleBottoMSheet> createState() => _AddScheduleBottoMSheetState();
}

class _AddScheduleBottoMSheetState extends State<AddScheduleBottoMSheet> {
  final controller = Get.put(ServiceCenterCalendarController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return GetBuilder<ServiceCenterCalendarController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: mediaQuery.padding.top * 4),
              padding: EdgeInsets.only(top: 10.h, right: 16.w, left: 20.w),
              decoration: BoxDecoration(
                color: AppColors.white1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Center(
                    child: Text(
                      'Add New Schedule',
                      style: CustomTextStyle.heading2.copyWith(
                        color: AppColors.nutralBlack1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CustomTextField(
                    label: "Schedule Name*",
                    hint: 'AC Fixing Service',
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    label: "Schedule Note",
                    hint: 'Urna turpis ante nunc nibh amet enim nec. Placerat in turpis ultrices amet mauris.',
                    maxLines: 3,
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      ).then((value) {});
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date',
                          style: CustomTextStyle.paragraphSmall.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.nutralBlack1,
                            // fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.textFieldBackground,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: AppColors.greyText),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'DD-MM-YYYY',
                                style: TextStyle(
                                  color: AppColors.subText,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset(Assets.images.svg.calendarMonth),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Start at',
                    style: CustomTextStyle.paragraphSmall.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.nutralBlack1,
                      // fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {});
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
                            '10:30 AM',
                            style: TextStyle(
                              color: AppColors.nutralBlack2,
                              fontSize: 16.sp,
                              fontFamily: 'Poppins',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reminds me",
                        style: CustomTextStyle.paragraphSmall.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.nutralBlack1,
                          // fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 18.sp,
                        width: 32.sp,
                        child: FittedBox(
                          child: CupertinoSwitch(
                            applyTheme: true,
                            value: true,
                            onChanged: (v) {},
                            activeColor: AppColors.primaryBlue1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryButton(
                          onPressed: () {},
                          text: 'Reset',
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: PrimaryButton(
                          onPressed: () {
                            Get.back();
                          },
                          text: 'Save',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
