import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/dashboard/views/dashboard_view.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/work_order/controllers/work_order_controller.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/work_order/views/work_order_view.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/work_order_search/controllers/work_order_search_controller.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import '../../../shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../controllers/service_center_controller.dart';
import '../sub_modules/dashboard/controllers/dashboard_controller.dart';

class ServiceCenterView extends GetView<ServiceCenterController> {
  const ServiceCenterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    Get.put(WorkOrderController());
    Get.put(WorkOrderSearchController());
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbarMinimal(
        title: 'Service Center',

        trailing: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              onTap: ()=>Get.toNamed(Routes.WORK_ORDER_SEARCH),
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
                labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: 'Poppins'),
                indicatorColor: AppColors.nutralBlack1,
                unselectedLabelColor: AppColors.nutralBlack2,
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: 'Poppins'),

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
            ),            Container(
              height: 1.h,
              color: AppColors.greyStrokColor,
            ),

            Expanded(
              child: TabBarView(
                children: [
                  const DashboardView(),
                  const WorkOrderView(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
