import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class BusinessManagerMoneyMatrics extends StatelessWidget {
  const BusinessManagerMoneyMatrics({
    required this.amount,
    required this.title,
    required this.type,
    super.key,
  });

  final String amount;
  final String title;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.nutralBlack1.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 0),
            spreadRadius: 2,
          )
        ],
        color: AppColors.white1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            amount,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.nutralBlack1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.nutralBlack1,
            ),
          ),
          Text(
            type,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.nutralBlack2,
            ),
          ),
        ],
      ),
    );
  }
}
