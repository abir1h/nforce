import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/expense/view/add_new_expanse.dart';
import 'package:nuforce/app/modules/settings/sub_modules/expense/view/expense_code_screen.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'expense_detail_screen.dart';
import '../widgets/expense_item_card.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../widgets/expense_view_bottomsheet.dart';

class ExpenseView extends StatefulWidget {
  const ExpenseView({super.key});

  @override
  State<ExpenseView> createState() => _ExpenseViewState();
}

class _ExpenseViewState extends State<ExpenseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbarMinimal(
        title: 'Expenses',
        trailing: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.to<void>(() => const ExpenseCodeScreen());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: AppColors.white2,
                ),
                child: Center(
                  child: Text(
                    'Code',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.primaryBlue1,
                    ),
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
          children: [
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
                GestureDetector(
                  onTap: () {
                    showCupertinoModalPopup<void>(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) => const ExpenseViewBottomsheet(),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.primaryBlue1,
                    ),
                    child: SvgPicture.asset(Assets.images.svg.filter2),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Expenses',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: AppColors.nutralBlack1,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to<void>(() => const AddExpenseViewScreen());
                  },
                  child: Text(
                    '+ Add',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: AppColors.nutralBlack1,
                    ),
                  ),
                ),
              ],
            ),
            14.h.vSpace,
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                ExpenseItemCard(
                  onTap: () {
                    Get.to<void>(() => const ExpenseDetailScreen());
                  },
                  onInstallTap: () {},
                ),
                SizedBox(
                  height: 16.h,
                ),
                ExpenseItemCard(
                  onTap: () {
                    Get.to<void>(() => const ExpenseDetailScreen());
                  },
                  onInstallTap: () {},
                ),
                SizedBox(
                  height: 16.h,
                ),
                ExpenseItemCard(
                  onTap: () {
                    Get.to<void>(() => const ExpenseDetailScreen());
                  },
                  onInstallTap: () {},
                ),
                SizedBox(
                  height: 16.h,
                ),
                ExpenseItemCard(
                  onTap: () {
                    Get.to<void>(() => const ExpenseDetailScreen());
                  },
                  onInstallTap: () {},
                ),
                SizedBox(
                  height: 16.h,
                ),
                ExpenseItemCard(
                  onTap: () {
                    Get.to<void>(() => const ExpenseDetailScreen());
                  },
                  onInstallTap: () {},
                ),
                SizedBox(
                  height: 16.h,
                ),
                ExpenseItemCard(
                  onTap: () {
                    Get.to<void>(() => const ExpenseDetailScreen());
                  },
                  onInstallTap: () {},
                ),
                SizedBox(
                  height: 16.h,
                ),
                ExpenseItemCard(
                  onTap: () {
                    Get.to<void>(() => const ExpenseDetailScreen());
                  },
                  onInstallTap: () {},
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
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
