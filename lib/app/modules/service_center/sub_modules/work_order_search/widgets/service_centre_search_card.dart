import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../../../../settings/widgets/text_card.dart';

class ServiceCentreSearchCard extends StatelessWidget {
  const ServiceCentreSearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: AppColors.white1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "WOAT351",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: "Poppins", color: AppColors.nutralBlack1),
                  ),
                  Text(
                    "27 Aug, 2023",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, fontFamily: "Poppins", color: AppColors.nutralBlack2),
                  ),
                ],
              ),
              TextCard(
                buttonText: "Work Order",
                bgColor: AppColors.primaryBlue1,
                textColor: AppColors.white1,
              )
            ],
          ),
          SizedBox(
            height: 6.h,
          ),
        ],
      ),
    );
  }
}
