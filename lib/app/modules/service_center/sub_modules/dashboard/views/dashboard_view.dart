import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../business_manager/widgets/custome_pie_chart.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/dashboard_chart.dart';
import '../widgets/user_progress_card.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightShade,
        body: Obx(() {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
                  decoration: const BoxDecoration(color: AppColors.white1),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text.rich(TextSpan(
                            text: 'Report',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                fontFamily: "Poppins",
                                color: AppColors.nutralBlack1),
                            children: <InlineSpan>[
                              TextSpan(
                                text: '(Dashboard & Colander )',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    fontFamily: "Poppins",
                                    color: AppColors.nutralBlack1),
                              )
                            ])),
                      ),
                      SvgPicture.asset(Assets.images.svg.calendarReport)
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: SfCartesianChart(
                    backgroundColor: Colors.white,
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(
                      minimum: 0,
                      maximum: 40,
                      interval: 5, // Changed interval to 5 for $5K intervals
                    ),
                    series: <ChartSeries>[
                      ColumnSeries<ChartData, String>(
                        dataSource: controller.data.toList(),
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        name: 'Gold',
                        color: const Color.fromRGBO(8, 142, 255, 1),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Revenue Change',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                fontFamily: "Poppins"),
                          ),
                          Text(
                            'Revenue change breakdown by cities',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                fontFamily: "Poppins",
                                color: AppColors.nutralBlack2),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const DashBoardChartWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Text(
                    "User Progress",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        color: AppColors.nutralBlack1),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                const UserProgressCard(),
                const UserProgressCard(),
                const UserProgressCard(),
                const UserProgressCard(),
                const UserProgressCard(),
                const UserProgressCard(),
                SizedBox(
                  height: 32.h,
                ),
              ],
            ),
          );
        }));
  }
}
