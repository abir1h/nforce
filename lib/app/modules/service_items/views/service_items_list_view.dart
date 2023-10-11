import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/components/service_button.dart';
import 'package:nuforce/app/modules/service_items/widgets/tabs.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

import '../controllers/service_items_controller.dart';

class ServiceItemsListView extends GetView<ServiceItemsController> {
  const ServiceItemsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: CustomAppbarMinimal(
        title: 'Service Items',
        trailing: [
          GestureDetector(
            onTap: () {},
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  '+ Add',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ServiceMiniTabs(controller: controller),
              SizedBox(height: 15.sp),
            ],
          ),
        ),
      ),
    );
  }
}
