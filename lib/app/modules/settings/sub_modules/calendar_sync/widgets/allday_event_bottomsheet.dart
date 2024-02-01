import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';

class AlldayEventBottomsheet extends StatefulWidget {
  const AlldayEventBottomsheet({
    super.key,
  });

  @override
  State<AlldayEventBottomsheet> createState() =>
      _AlldayEventBottomsheetState();
}

class _AlldayEventBottomsheetState
    extends State<AlldayEventBottomsheet> {
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
          margin: EdgeInsets.only(top: mediaQuery.padding.top * 8),
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
                      "All-day events",
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
                    icon: Icon(Icons.clear),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 24.h,
              ),
              RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'None',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == "None"
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "None",
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
              ),
              RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Day of event at 9:00 am',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == 'Day of event at 9:00 am'
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "Day of event at 9:00 am",
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
              ),
              RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Day before event at 5:00 am',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == 'Day before event at 5:00 am'
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "Day before event at 5:00 am",
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
              ),
              RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Day before event at 9:00 am',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == 'Day before event at 9:00 am'
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "Day before event at 9:00 am",
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
              ),
              RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  '2 Day before event at 9:00 am',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == '2 Day before event at 9:00 am'
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "2 Day before event at 9:00 am",
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
              ),
              RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  '1 week before event at 9:00 am',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == '1 week before event at 9:00 am'
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "1 week before event at 9:00 am",
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
