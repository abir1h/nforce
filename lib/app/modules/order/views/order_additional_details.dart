import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class OrderAdditionDetailsTile extends StatelessWidget {
  const OrderAdditionDetailsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14, top: 10, right: 14, bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.white1,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.white2,
            blurRadius: 10.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Created work order WOAT351 for Aaron Taylor',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Dilruba Khanam Jesey',
            style: TextStyle(
              color: AppColors.nutralBlack2,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            '25 Jan 2023 - 08:30PM',
            style: TextStyle(
              color: AppColors.nutralBlack2,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
