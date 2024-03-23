import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

import '../../../../../shared/widgets/custom_checkbox.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../../../../../shared/widgets/secondary_button.dart';
import 'button_with_border.dart';

class InsertRouteBttomSheet extends StatefulWidget {
  const InsertRouteBttomSheet({
    super.key,
  });

  @override
  State<InsertRouteBttomSheet> createState() => _InsertRouteBttomSheetState();
}

class _InsertRouteBttomSheetState extends State<InsertRouteBttomSheet> {
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
          margin: EdgeInsets.only(top: mediaQuery.padding.top * 5),
          padding: EdgeInsets.only(top: 16.h, right: 16.w, left: 20.w),
          decoration: BoxDecoration(
            color: AppColors.white1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "John Williamson",
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
                Row(
                  children: [
                    CustomCheckbox(
                      activeColor: AppColors.primaryBlue1,
                      value: true,
                      onChanged: (v) {},
                    ),
                    Text(
                      'Completed',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        fontFamily: "Poppins",
                        color: AppColors.nutralBlack2,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: AppColors.white3,
                ),
                8.h.vSpace,
                Text(
                  "Details",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: "Poppins", color: AppColors.nutralBlack1),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "John Williamson",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: "Poppins", color: AppColors.primaryBlue1),
                ),
                Divider(
                  thickness: 1,
                  color: AppColors.white3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Team",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: "Poppins", color: AppColors.nutralBlack1),
                    ),
                    BorderButton(
                      text: "Assign",
                      color: AppColors.green3,
                    )
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: AppColors.white3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: "Poppins", color: AppColors.nutralBlack1),
                    ),
                    BorderButton(
                      text: "Route from here",
                      color: AppColors.primaryBlue1,
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "505 Carlton Pointe Dr #90Palmetto, Georgia(GA), 30268",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    fontFamily: "Poppins",
                    color: AppColors.nutralBlack2,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: AppColors.white3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Line Items",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: "Poppins", color: AppColors.nutralBlack1),
                    ),
                    BorderButton(
                      text: "Add Line items",
                      color: AppColors.primaryBlue1,
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "No line items listed",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    fontFamily: "Poppins",
                    color: AppColors.nutralBlack2,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: AppColors.white3,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Row(
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
                          text: 'Apply',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
