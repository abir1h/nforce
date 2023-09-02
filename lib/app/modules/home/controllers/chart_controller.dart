import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';

class ChartController extends GetxController {
  RxBool isSmootherSelected = false.obs;
  RxBool isSaferSelected = true.obs;
  RxBool isCleanerSelected = true.obs;
  RxBool isOnTimeSelected = false.obs;

  final smootherChartData = LineChartBarData(
    isCurved: true,
    color: AppColors.green,
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(
      show: false,
      color: AppColors.lightPink.withOpacity(0),
    ),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 1.5),
      FlSpot(5, 1),
      FlSpot(7, 2),
      FlSpot(8, 4),
      FlSpot(13, 2),
    ],
  );
  final onTimeChartData = LineChartBarData(
    isCurved: true,
    color: AppColors.orange,
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(
      show: false,
      color: AppColors.lightPink.withOpacity(0),
    ),
    spots: const [
      FlSpot(0, 1),
      FlSpot(3, 1.5),
      FlSpot(7, 2),
      FlSpot(10, 2.5),
      FlSpot(12, 3),
      FlSpot(13, 1),
    ],
  );

  final saferChartData = LineChartBarData(
    isCurved: true,
    color: AppColors.primaryBlue1,
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(
      show: false,
      color: AppColors.lightPink.withOpacity(0),
    ),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 2.8),
      FlSpot(7, 1.2),
      FlSpot(10, 2.8),
      FlSpot(12, 2.6),
      FlSpot(13, 3.9),
    ],
  );

  final cleanerChartData = LineChartBarData(
    isCurved: true,
    color: AppColors.primaryBlue2,
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 2),
      FlSpot(3, 1.5),
      FlSpot(5, 1.4),
      FlSpot(7, 3.4),
      FlSpot(10, 2),
      FlSpot(12, 2.2),
      FlSpot(13, 1.8),
    ],
  );
}
