import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:pie_chart/pie_chart.dart';

class DashBoardChartWidget extends StatelessWidget {
  const DashBoardChartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: const {
        "+10% New York": 3,
        "-7% London": 3,
        "+20% California": 3,
      },
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: const [
        AppColors.primaryBlue1,
        AppColors.yellow,
        AppColors.agentCardBg1,
      ],
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      centerText: "10",
      centerTextStyle: TextStyle(
        color: AppColors.primaryBlue1,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),

      legendOptions: LegendOptions(
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendTextStyle: TextStyle(
          color: AppColors.subText,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: false,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }
}
