import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/controllers/invoice_controller.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/work_order_view/sub_modules/over_view/controllers/over_view_controller.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/work_order_view/sub_modules/over_view/views/over_view.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../../../../../../gen/assets.gen.dart';
import '../controllers/work_order_view_controller.dart';
import '../sub_modules/invoice/views/invoice_view.dart';

class WorkOrderViewView extends GetView<WorkOrderViewController> {
  const WorkOrderViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OverViewController());
    Get.put(InvoiceController());
/*    Get.put(DashboardController());
    Get.put(WorkOrderController());
    Get.put(WorkOrderSearchController());
    Get.put(ServiceCenterCalendarController());
    Get.put(ServiceCenterMapsController());*/
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.white1,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Eleanor Pena",
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              " 25 Aug, 2023",
              style: TextStyle(
                color: AppColors.nutralBlack2,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back<void>();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.nutralBlack1,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 12),
            child: GestureDetector(
              child: Container(

                padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 5.h),
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(4.r),
                    color: AppColors.lightBlueBg
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.images.svg.edit),const SizedBox(width: 4,),
                    Text(
                      "Edit",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        fontFamily: "Poppins",
                        color: AppColors.primaryBlue1,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
/*
      appBar: CustomAppbarMinimal(
        title: 'Eleanor Pena',subTitle: '25 Aug, 2023',

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
*/
      body: DefaultTabController(
        length: 5,
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
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    fontFamily: 'Poppins'),
                indicatorColor: AppColors.nutralBlack1,
                unselectedLabelColor: AppColors.nutralBlack2,
                unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    fontFamily: 'Poppins'),

                indicator: const BoxDecoration(
                  color: AppColors
                      .primaryBlue1, // Set the overlay color for the selected tab
                ),
                padding: EdgeInsets.zero,

                // Set the indicator color here

                tabs: const [
                  Tab(text: 'Overview'),
                  Tab(text: 'Invoices'),
                  Tab(text: 'Schedules'),
                  Tab(text: 'Locations'),
                  Tab(text: 'Policies'),
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
                  const OverView(),
                  const InvoiceView(),
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
