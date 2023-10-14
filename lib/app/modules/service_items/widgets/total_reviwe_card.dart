import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/service_items/widgets/x_rting_bar.dart';
import 'package:nuforce/app/utils/colors.dart';

class TotalReviewCard extends StatelessWidget {
  const TotalReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(4.sp),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primaryBlue1,
              width: 2,
            ),
          ),
          child: Text(
            '4.9',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryBlue1,
              fontSize: 30.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.41,
            ),
          ),
        ),
        const Expanded(
          child: Column(
            children: [
              XStartRating(x: 5, count: 12, total: 23),
              XStartRating(x: 4, count: 5, total: 23),
              XStartRating(x: 3, count: 4, total: 23),
              XStartRating(x: 2, count: 2, total: 23),
              XStartRating(x: 1, count: 0, total: 23),
            ],
          ),
        ),
      ],
    );
  }
}
