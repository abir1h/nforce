import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/work_order/controllers/work_order_controller.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../business_manager/widgets/custome_pie_chart.dart';
import '../widgets/work_order_card.dart';


class WorkOrderView extends GetView<WorkOrderController> {
  const WorkOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightShade,
        body: SingleChildScrollView(
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
              WorkOrderCard(),
              WorkOrderCard(),
              WorkOrderCard(),
              WorkOrderCard(),
              WorkOrderCard(),
              WorkOrderCard(),
              WorkOrderCard(),
              SizedBox(
                height: 32.h,
              ),
            ],
          ),
        ));
  }
}
