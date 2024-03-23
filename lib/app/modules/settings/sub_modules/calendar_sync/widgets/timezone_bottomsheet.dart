import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/calendar_sync/widgets/timezone_card.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../../../../../../gen/assets.gen.dart';

class TimeZoneBottomSheet extends StatefulWidget {
  const TimeZoneBottomSheet({
    super.key,
  });

  @override
  State<TimeZoneBottomSheet> createState() => _TimeZoneBottomSheetState();
}

class _TimeZoneBottomSheetState extends State<TimeZoneBottomSheet> {
  String selectedValue = 'None';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: mediaQuery.padding.top * 4),
          padding: EdgeInsets.only(top: 16.h, right: 16.w, left: 20.w),
          decoration: BoxDecoration(
            color: AppColors.white1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Time zone",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: AppColors.greyText,
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: SvgPicture.asset(
                              Assets.images.svg.search,
                              height: 18.h,
                              fit: BoxFit.contain,
                              width: 18.h,
                              color: AppColors.greyText,
                            ),
                          ),
                          hintStyle: TextStyle(
                            color: AppColors.greyText,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Container(
                    padding: EdgeInsets.all(14.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.primaryBlue1,
                    ),
                    child: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const TimezoneCard(
                      title: "Dhaka / Bangladesh",
                      subtitle: "GMT+6",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const TimezoneCard(
                      title: "Diego Garcia / UK",
                      subtitle: "GMT+3",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const TimezoneCard(
                      title: "Doha / Qatar",
                      subtitle: "GMT+2",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const TimezoneCard(
                      title: "Douala / Cameroon",
                      subtitle: "GMT+1",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const TimezoneCard(
                      title: "Dubai / UAE",
                      subtitle: "GMT+5",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const TimezoneCard(
                      title: "Dubai / UAE",
                      subtitle: "GMT+5",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const TimezoneCard(
                      title: "Dubai / UAE",
                      subtitle: "GMT+5",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
