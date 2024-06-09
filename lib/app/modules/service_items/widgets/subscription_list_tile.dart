import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/service_items/models/service_manager_data_model.dart';
import 'package:nuforce/app/modules/service_items/widgets/little_text_with_colored_bg.dart';
import 'package:nuforce/app/utils/colors.dart';

class SubscriptionListTile extends StatelessWidget {
  const SubscriptionListTile({
    super.key, this.data,
  });
  final ServiceMangerItemModel? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.white3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data!.name,
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Icon(
                Icons.favorite_outline,
                color: AppColors.nutralBlack1,
              ),
            ],
          ),
          Text(
            data!.categoryName,
            style: TextStyle(
              color: AppColors.subText,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
               LittleTextWithColoredBG(
                text: data!.itemCode,
                color: AppColors.blue,
              ),
              SizedBox(width: 4.w),
               LittleTextWithColoredBG(
                text: data!.itemType.toUpperCase(),
                color: AppColors.yellow,
              ),
              SizedBox(width: 4.w),
              Text(
                "\$${data!.totalCost}",
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
