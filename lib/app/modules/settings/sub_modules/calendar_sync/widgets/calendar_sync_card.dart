import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class CalendarSyncCard extends StatelessWidget {
  final String title,subtitile;
  final void Function()? onTap;

  const CalendarSyncCard({super.key, this.onTap, required this.title, required this.subtitile});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
          color: AppColors.textFieldBackground,
          borderRadius: BorderRadius.circular(4.r),border: Border.all(color: AppColors.white3),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: "Poppins",
                  color: AppColors.nutralBlack1,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                subtitile,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: "Poppins",
                  color: AppColors.green3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
