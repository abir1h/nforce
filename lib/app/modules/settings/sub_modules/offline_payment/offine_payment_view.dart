import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/offline_payment/add_payment.dart';
import 'package:nuforce/app/modules/settings/widgets/offline_payment_card.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

class OfflinePayment extends StatefulWidget {
  const OfflinePayment({super.key});

  @override
  State<OfflinePayment> createState() => _OfflinePaymentState();
}

class _OfflinePaymentState extends State<OfflinePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbarMinimal(
        title: 'Offline Payments',
        trailing: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              onTap: () => Get.to<void>(() => const AddPayment()),
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    size: 24.r,
                    color: AppColors.nutralBlack1,
                  ),
                  Text(
                    'Add',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColors.nutralBlack1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                PopupMenuButton(
                  onSelected: (value) {
                    // Handle the selected value here
                  },
                  itemBuilder: (context) => popupMenuItems,
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
              height: 14.h,
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                const OfflinePaymentCard(),
                SizedBox(
                  height: 16.h,
                ),
                const OfflinePaymentCard(),
                SizedBox(
                  height: 16.h,
                ),
                const OfflinePaymentCard(),
                SizedBox(
                  height: 16.h,
                ),
                const OfflinePaymentCard(),
                SizedBox(
                  height: 16.h,
                ),
                const OfflinePaymentCard(),
              ],
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
