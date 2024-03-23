import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';

class EventBottomsheeet extends StatefulWidget {
  const EventBottomsheeet({
    super.key,
  });

  @override
  State<EventBottomsheeet> createState() =>
      _EventBottomsheeetState();
}

class _EventBottomsheeetState
    extends State<EventBottomsheeet> {
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
                      "Events",
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
                  'On Time',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == 'On Time'
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "On Time",
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
                  '5 mis before',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == '5 mis before'
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "5 mis before",
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
                  '15 mins before',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == '15 mins before'
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "15 mins before",
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
                  '30 mins before',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == '30 mins before'
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "30 mins before",
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
                  '1 day before',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == '1 day before'
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "1 day before",
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
              ), RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  '1 day before',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    fontFamily: "Poppins",
                    color: selectedValue == '1 day before'
                        ? AppColors.nutralBlack2
                        : AppColors.nutralBlack1,
                  ),
                ),
                value: "1 day before",
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
