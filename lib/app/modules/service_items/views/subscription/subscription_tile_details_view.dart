import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/views/subscription/add_or_edit_subscription_view.dart';
import 'package:nuforce/app/modules/service_items/widgets/little_text_with_colored_bg.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class SubscriptionTileDetailsView extends StatelessWidget {
  const SubscriptionTileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Details'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
          child: SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  Text(
                    'Code',
                    style: TextStyle(
                      color: AppColors.subText,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      const LittleTextWithColoredBG(text: 'AS998', color: AppColors.violet),
                      SizedBox(width: 4.w),
                      const LittleTextWithColoredBG(text: 'Service', color: AppColors.blue),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  const TitleSubtitleMinimal(
                    title: 'Name',
                    subtitle: 'Interiorscaping Experts',
                  ),
                  SizedBox(height: 16.h),
                  const TitleSubtitleMinimal(
                    title: 'Category',
                    subtitle: 'Lawn Services',
                  ),
                  SizedBox(height: 16.h),
                  const TitleSubtitleMinimal(
                    title: 'Instructions',
                    subtitle: 'N/A',
                  ),
                  SizedBox(height: 16.h),
                  const TitleSubtitleMinimal(
                    title: 'Cost',
                    subtitle: '\$25.00',
                  ),
                  SizedBox(height: 16.h),
                  const TitleSubtitleMinimal(
                    title: 'Quantity',
                    subtitle: '1',
                  ),
                  SizedBox(height: 16.h),
                  const TitleSubtitleMinimal(
                    title: 'Unit Metric',
                    subtitle: 'Meter (m)',
                  ),
                  SizedBox(height: 16.h),
                  const TitleSubtitleMinimal(
                    title: 'Item Discount',
                    subtitle: 'N/A',
                  ),
                  SizedBox(height: 16.h),
                  const TitleSubtitleMinimal(
                    title: 'Discount Notes',
                    subtitle: 'N/A',
                  ),
                  SizedBox(height: 16.h),
                  const TitleSubtitleMinimal(
                    title: 'Taxable',
                    subtitle: 'Active',
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryButton(
                          onPressed: () {
                            Fluttertoast.showToast(msg: 'Deleted');
                            Get.back();
                          },
                          text: 'Delete',
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: PrimaryButton(
                          onPressed: () {
                            Get.to(() => const AddOrEditSubscriptionView(isEdit: true));
                          },
                          text: 'Edit',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
