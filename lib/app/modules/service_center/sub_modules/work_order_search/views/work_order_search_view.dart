import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/work_order_search/views/contact_screen.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/work_order_search/views/line_item_screen.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/work_order_search/views/work_order_screen.dart';
import 'package:nuforce/app/modules/settings/widgets/text_card.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../utils/colors.dart';
import '../controllers/work_order_search_controller.dart';

class WorkOrderSearchView extends GetView<WorkOrderSearchController> {
  const WorkOrderSearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgWithOpacity,
        resizeToAvoidBottomInset: true,
        appBar: CustomAppbarMinimal(
          title: 'Service Center',
        ),
        body: SingleChildScrollView(

          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              SizedBox(
                height: 13.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.greyText,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search in name...',
                          hintStyle: TextStyle(
                            color: AppColors.greyText,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SvgPicture.asset(Assets.images.svg.search),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Obx(() => Column(
                children: [
                  Row(
                        children: [
                          Expanded(
                            child: TextCard(
                              onPressed: () => controller.setTabbedItem(0), // Pass a callback function
                              buttonText: "Work Order",
                              textColor: controller.count.value == 0
                                  ? AppColors.white1
                                  : AppColors.nutralBlack2,
                              bgColor: controller.count.value == 0
                                  ? AppColors.primaryBlue1
                                  : Colors.white,
                              borderColor: controller.count.value == 0
                                  ? Colors.transparent
                                  : AppColors.greyStrokColor,
                            ),
                          ),

                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: TextCard(
                              onPressed: () => controller.setTabbedItem(1), // Pass a callback function
                              buttonText: "Contact",
                              textColor: controller.count.value == 1
                                  ? AppColors.white1
                                  : AppColors.nutralBlack2,
                              bgColor: controller.count.value == 1
                                  ? AppColors.primaryBlue1
                                  : Colors.white,
                              borderColor: controller.count.value == 1
                                  ? Colors.transparent
                                  : AppColors.greyStrokColor,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: TextCard(
                              onPressed: () => controller.setTabbedItem(2), // Pass a callback function
                              buttonText: "Line Item",
                              textColor: controller.count.value == 2
                                  ? AppColors.white1
                                  : AppColors.nutralBlack2,
                              bgColor: controller.count.value == 2
                                  ? AppColors.primaryBlue1
                                  : Colors.white,
                              borderColor: controller.count.value == 2
                                  ? Colors.transparent
                                  : AppColors.greyStrokColor,
                            ),
                          ),
                        ],
                      ),
                  controller.count.value==0?const WorkOrderScreen():controller.count.value==1?const ContactScreen():const LineItemScreen()
                ],
              ))
            ],
          ),
        ));
  }
}
