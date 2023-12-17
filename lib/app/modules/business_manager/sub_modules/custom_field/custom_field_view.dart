import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/custom_field_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/custom_field/customer_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/custom_field/pre_order_field_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/custom_field/project_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/custom_field/service_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/custom_field/widgets/detail_card.dart';
import 'package:nuforce/app/routes/app_pages.dart';

import '../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../utils/colors.dart';
import 'agent_view.dart';

class CustomFieldView extends StatefulWidget {
  const CustomFieldView({super.key});

  @override
  State<CustomFieldView> createState() => _CustomFieldViewState();
}

class _CustomFieldViewState extends State<CustomFieldView> {
  final CustomFieldController controller = Get.put(CustomFieldController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white1,
        resizeToAvoidBottomInset: true,
        appBar: CustomAppbarMinimal(
          title: 'Customer Detail Field',
          trailing: [
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: GestureDetector(
                onTap: () => Get.toNamed(Routes.SERVICE_ITEMS),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      size: 24.r,
                      color: AppColors.nutralBlack1,
                    ),
                    Text(
                      "Add",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                          fontSize: 14.sp,
                          color: AppColors.nutralBlack1),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: DefaultTabController(
          length: 5,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: AppColors.tabbarColor),
                child: TabBar(
                  isScrollable: true,
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "Poppins"),
                  indicatorColor: AppColors.nutralBlack1,
                  unselectedLabelColor: AppColors.nutralBlack2,
                  unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "Poppins"),

                  indicator: const BoxDecoration(
                      color: AppColors
                          .primaryBlue1 // Set the overlay color for the selected tab
                      ), // Set the indicator color here

                  tabs: const [
                    Tab(
                      text: 'Customer',
                    ),
                    Tab(text: 'Agent'),
                    Tab(text: 'Service'),
                    Tab(text: 'Project'),
                    Tab(
                      text: 'Pre-order Fields',
                    ),
                  ],
                ),
              ),
              const Expanded(
                  child: TabBarView(
                children: [
                  Customer_View(),
                  AgentView(),
                  ServiceView(),
                  ProjectView(),
                  PreorderView(),
                ],
              ))
            ],
          ),
        ));
  }
}
