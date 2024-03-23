import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomPieChartWidget extends StatelessWidget {
  const CustomPieChartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PieChart(

      dataMap: const {
        "19% Others": 3,
        "37% Agents": 3,
        "47% Sales": 3,
      },
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: const [
        AppColors.red,
        AppColors.blue,
        AppColors.green,
      ],
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      centerText: "45",
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
