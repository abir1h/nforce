import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../../../../../shared/widgets/primary_button.dart';
import '../../../../../shared/widgets/secondary_button.dart';
import 'expense_view_screen.dart';

class ExpenseDetailScreen extends StatefulWidget {
  const ExpenseDetailScreen({super.key});

  @override
  State<ExpenseDetailScreen> createState() => _ExpenseDetailScreenState();
}

class _ExpenseDetailScreenState extends State<ExpenseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          children: [
            Expanded(
              child: SecondaryButton(
                onPressed: () {
                  Get.back();
                },
                text: 'Decline',
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: PrimaryButton(
                onPressed: () {
                  Get.back();
                },
                text: 'Approve',
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: CustomAppbarMinimal(
        title: 'Expenses',
        trailing: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: AppColors.white2,
              ),
              child: Center(
                child: Text(
                  'Dispute',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.primaryBlue1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              Assets.images.png.expReport.keyName,
              height: 200.h,
              width: 1.sw,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Electricity Bill",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  fontFamily: "Poppins",
                  color: AppColors.nutralBlack1),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              r"$20,000.00",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  fontFamily: "Poppins",
                  color: AppColors.primaryBlue1),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Jan 05, 2024 - 10:30 PM",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  fontFamily: "Poppins",
                  color: AppColors.nutralBlack2),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Payable amount Receipt. Important Notic All Payment Done by Cheque shou ld be in the name of Account Officer.",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  fontFamily: "Poppins",
                  color: AppColors.nutralBlack2),
            ),
          ],
        ),
      ),
    );
  }

  List<PopupMenuEntry<int>> popupMenuItems = [
    PopupMenuItem<int>(
      value: 1,
      child: Text(
        'Pending',
        style: CustomTextStyle.paragraphExtraSmall.copyWith(
          color: AppColors.subText,
        ),
      ),
    ),
    PopupMenuItem<int>(
      value: 2,
      child: Text(
        'Processing',
        style: CustomTextStyle.paragraphExtraSmall.copyWith(
          color: AppColors.subText,
        ),
      ),
    ),
    PopupMenuItem<int>(
      value: 3,
      child: Text(
        'Complete',
        style: CustomTextStyle.paragraphExtraSmall.copyWith(
          color: AppColors.subText,
        ),
      ),
    ),
    PopupMenuItem<int>(
      value: 4,
      child: Text(
        'Cancelled',
        style: CustomTextStyle.paragraphExtraSmall.copyWith(
          color: AppColors.subText,
        ),
      ),
    ),
  ];
}
