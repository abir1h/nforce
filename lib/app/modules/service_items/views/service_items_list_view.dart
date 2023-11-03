import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/controllers/add_new_service_controller.dart';
import 'package:nuforce/app/modules/service_items/views/add_new_service_view.dart';
import 'package:nuforce/app/modules/service_items/widgets/addon_items_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/all_items_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/material_items_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/package_items_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/search_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/service_items_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/subscription_items_widget.dart';
import 'package:nuforce/app/modules/service_items/widgets/tabs.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

import '../controllers/service_items_controller.dart';

class ServiceItemsListView extends GetView<ServiceItemsController> {
  const ServiceItemsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => CustomAppbarMinimal(
                title: controller.miniTabEnum.value == ServiceTabEnum.all
                    ? 'All Items'
                    : controller.miniTabEnum.value == ServiceTabEnum.service
                        ? 'Service Items'
                        : controller.miniTabEnum.value == ServiceTabEnum.material
                            ? 'Material Items'
                            : controller.miniTabEnum.value == ServiceTabEnum.package
                                ? 'Package'
                                : controller.miniTabEnum.value == ServiceTabEnum.subscription
                                    ? 'Subscription'
                                    : 'Addons',
                trailing: [
                  GestureDetector(
                    onTap: () {
                      if (!AddNewServiceController().initialized) {
                        Get.put(AddNewServiceController());
                      }
                      Get.to(() => const AddNewServiceView());
                    },
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
            ),
            ServiceMiniTabs(controller: controller),
            SizedBox(height: 15.sp),
            const SearchWidget(),
            SizedBox(height: 20.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Items (20)',
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3.5.sp),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryBlue3,
                    ),
                    child: SvgPicture.asset(Assets.images.svg.sort),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.sp),
              child: const Divider(color: AppColors.greyText),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Obx(
                  () => controller.miniTabEnum.value == ServiceTabEnum.all
                      ? const AllItems()
                      : controller.miniTabEnum.value == ServiceTabEnum.service
                          ? const ServiceItems()
                          : controller.miniTabEnum.value == ServiceTabEnum.material
                              ? const MaterialItems()
                              : controller.miniTabEnum.value == ServiceTabEnum.package
                                  ? const PackageItems()
                                  : controller.miniTabEnum.value == ServiceTabEnum.subscription
                                      ? const SubscriptionItems()
                                      : const AddonsItems(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
