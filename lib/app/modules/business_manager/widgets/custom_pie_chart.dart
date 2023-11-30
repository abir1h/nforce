import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Expanded(
        child: AspectRatio(
          aspectRatio: 1,
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 20,
              sections: showingSections(),
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.red,
            value: 33,
            title: '',
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.blue,
            value: 33,
            title: '',
          );
        default:
          return PieChartSectionData(
            color: AppColors.green,
            value: 15,
            title: '',
          );
      }
    });
  }
}
