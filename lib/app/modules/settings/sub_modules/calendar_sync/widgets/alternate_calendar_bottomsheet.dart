import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';



class AlternateCalendarBottomSheet extends StatefulWidget {
  const AlternateCalendarBottomSheet({
    super.key,
  });

  @override
  State<AlternateCalendarBottomSheet> createState() =>
      _AlternateCalendarBottomSheetState();
}

class _AlternateCalendarBottomSheetState
    extends State<AlternateCalendarBottomSheet> {
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
                      "Alternate Calendar",
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
                  'Korean lunar',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == 'Korean lunar'
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "Korean lunar",
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
                  'Chinese lunar',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == 'Chinese lunar'
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "Chinese lunar",
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
                  'Vietnamese lunar',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == 'Vietnamese lunar'
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "Vietnamese lunar",
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
                  'Hijri',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == 'Hijri'
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "Hijri",
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
                  'Shamsi',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == 'Shamsi'
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "Shamsi",
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
