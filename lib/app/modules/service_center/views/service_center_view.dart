import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/calendar/views/calendar_view.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/dashboard/views/dashboard_view.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/service_center_maps/views/service_center_maps_view.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/work_order/views/work_order_view.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import '../../../shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../controllers/service_center_controller.dart';
import '../sub_modules/estimation/views/estimation_view.dart';

class ServiceCenterView extends StatefulWidget {
  const ServiceCenterView({Key? key}) : super(key: key);

  @override
  State<ServiceCenterView> createState() => _ServiceCenterViewState();
}

class _ServiceCenterViewState extends State<ServiceCenterView> {
  @override
  void initState() {
    Get.put(ServiceCenterController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbarMinimal(
        title: 'Service Center',
        trailing: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              onTap: () => Get.toNamed(Routes.WORK_ORDER_SEARCH),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 24.r,
                    color: AppColors.nutralBlack1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 6,
        child: Column(
          children: [
            Container(
              height: 1.h,
              color: AppColors.greyStrokColor,
            ),
            Container(
              decoration: const BoxDecoration(color: AppColors.white1),
              child: TabBar(
                isScrollable: true,
                labelStyle: CustomTextStyle.heading4,
                indicatorColor: AppColors.nutralBlack1,
                unselectedLabelColor: AppColors.nutralBlack2,
                unselectedLabelStyle: CustomTextStyle.heading4,
                labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                indicator: const BoxDecoration(
                  color: AppColors.primaryBlue1, // Set the overlay color for the selected tab
                ),
                padding: EdgeInsets.zero,

                // Set the indicator color here

                tabs: const [
                  Tab(text: 'Dashboard'),
                  Tab(text: 'Work Order'),
                  Tab(text: 'Estimations'),
                  Tab(text: 'Invoice'),
                  Tab(text: 'Calendar'),
                  Tab(text: 'Map'),
                ],
              ),
            ),
            Container(
              height: 1.h,
              color: AppColors.greyStrokColor,
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const DashboardView(),
                  const WorkOrderView(),
                  const EstimationView(),
                  Container(),
                  const ServiceCenterCalendarView(),
                  const ServiceCenterMapsView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
