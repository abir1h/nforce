import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/calendar/controllers/calendar_controller.dart';
import 'package:nuforce/app/utils/colors.dart';
import '../../../../../utils/text_styles.dart';

class ViewScheduleBottomsheet extends StatefulWidget {
  const ViewScheduleBottomsheet({
    super.key,
  });

  @override
  State<ViewScheduleBottomsheet> createState() => _ViewScheduleBottomsheetState();
}

class _ViewScheduleBottomsheetState extends State<ViewScheduleBottomsheet> {
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
              margin: EdgeInsets.only(top: mediaQuery.padding.top * 9),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 2,
                      ),
                      Column(
                        children: [
                          Text(
                            '27 August 2023',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp, color: AppColors.nutralBlack1),
                          ),
                          Text(
                            'Sunday',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp, color: AppColors.nutralBlack1),
                          ),
                        ],
                      ),
                      GestureDetector(onTap: () => Get.back(), child: Icon(Icons.clear))
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'AC Fixing Service',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp, color: AppColors.nutralBlack1),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Urna turpis ante nunc nibh amet enim nec. Placerat in turpis ultrices amet mauris.',
                    style: CustomTextStyle.paragraphSmall.copyWith(fontWeight: FontWeight.w400, fontSize: 14.sp),
                  ),
                  SizedBox(height: 16.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date',
                        style: CustomTextStyle.paragraphSmall.copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp),
                      ),
                      Text(
                        '30-08-2023',
                        style: CustomTextStyle.paragraphSmall.copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp, color: AppColors.nutralBlack2),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start at',
                            style: CustomTextStyle.paragraphSmall.copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp),
                          ),
                          Text(
                            '10:30 AM',
                            style: CustomTextStyle.paragraphSmall.copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp, color: AppColors.nutralBlack2),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 32.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'End at',
                            style: CustomTextStyle.paragraphSmall.copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp),
                          ),
                          Text(
                            '11:15 AM',
                            style: CustomTextStyle.paragraphSmall.copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp, color: AppColors.nutralBlack2),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
