import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:nuforce/app/modules/home/components/custom_chart.dart';
import 'package:nuforce/app/modules/home/controllers/chart_controller.dart';

import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class BusinessManagerDailySalesCurve extends StatelessWidget {
  BusinessManagerDailySalesCurve({
    required this.details,
    required this.title,
    super.key,
  });

  final String title;
  final String details;
  final controller = ChartController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
          ),
        ],
        color: AppColors.white1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.nutralBlack1,
            ),
          ),
          Text(
            details,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.nutralBlack1,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: width,
            height: 140,
            child: Obx(
              () => CustomChart(
                lineBarsData: [
                  if (controller.isSmootherSelected.value) controller.smootherChartData,
                  if (controller.isSaferSelected.value) controller.saferChartData,
                  if (controller.isCleanerSelected.value) controller.cleanerChartData,
                  if (controller.isOnTimeSelected.value) controller.onTimeChartData,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
