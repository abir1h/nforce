import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/components/service_button.dart';
import 'package:nuforce/app/modules/service_items/views/service_items_list_view.dart';
import 'package:nuforce/app/modules/service_items/widgets/plugin_item_card.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

import '../controllers/service_items_controller.dart';

class ServiceItemsView extends GetView<ServiceItemsController> {
  const ServiceItemsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: 'Service Manager',
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.start,
                  children: [
                    ServiceButton(
                      svgPath: Assets.images.svg.service,
                      title: 'Service',
                      onTap: () {
                        late ServiceItemsController controller;
                        if (!ServiceItemsController().initialized) {
                          controller = Get.put(ServiceItemsController());
                        }
                        controller.miniTabEnum.value = ServiceTabEnum.all;
                        Get.to(() => const ServiceItemsListView());
                      },
                    ),
                    ServiceButton(
                      svgPath: Assets.images.svg.material,
                      title: 'Material',
                      onTap: () {
                        late ServiceItemsController controller;
                        if (!ServiceItemsController().initialized) {
                          controller = Get.put(ServiceItemsController());
                        }
                        controller.miniTabEnum.value = ServiceTabEnum.material;
                        Get.to(() => const ServiceItemsListView());
                      },
                    ),
                    ServiceButton(
                      svgPath: Assets.images.svg.package,
                      title: 'Package',
                      onTap: () {
                        late ServiceItemsController controller;
                        if (!ServiceItemsController().initialized) {
                          controller = Get.put(ServiceItemsController());
                        }
                        controller.miniTabEnum.value = ServiceTabEnum.package;
                        Get.to(() => const ServiceItemsListView());
                      },
                    ),
                    ServiceButton(
                      svgPath: Assets.images.svg.subscription,
                      title: 'Subscription',
                      onTap: () {
                        late ServiceItemsController controller;
                        if (!ServiceItemsController().initialized) {
                          controller = Get.put(ServiceItemsController());
                        }
                        controller.miniTabEnum.value = ServiceTabEnum.subscription;
                        Get.to(() => const ServiceItemsListView());
                        Future.delayed(const Duration(milliseconds: 200)).then((value) {
                          if (controller.scrollController.hasClients) {
                            controller.scrollController.animateTo(
                              controller.scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
                        });
                      },
                    ),
                    ServiceButton(
                      svgPath: Assets.images.svg.addons,
                      title: 'Addons',
                      onTap: () {
                        late ServiceItemsController controller;
                        if (!ServiceItemsController().initialized) {
                          controller = Get.put(ServiceItemsController());
                        }
                        controller.miniTabEnum.value = ServiceTabEnum.addons;
                        Get.to(() => const ServiceItemsListView());
                        Future.delayed(const Duration(milliseconds: 200)).then((value) {
                          if (controller.scrollController.hasClients) {
                            controller.scrollController.animateTo(
                              controller.scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.sp),
            Padding(
              padding: EdgeInsets.only(left: 20.sp),
              child: Text(
                'Promotions',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.start,
                  children: [
                    ServiceButton(
                      svgPath: Assets.images.svg.coupon,
                      title: 'Coupon',
                      onTap: () {},
                    ),
                    ServiceButton(
                      svgPath: Assets.images.svg.discount,
                      title: 'Discount',
                      onTap: () {},
                    ),
                    ServiceButton(
                      svgPath: Assets.images.svg.offer,
                      title: 'Offer',
                      onTap: () {},
                    ),
                    ServiceButton(
                      svgPath: Assets.images.svg.gift,
                      title: 'Gift',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.sp),
            Padding(
              padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Plugins',
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'See All',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: AppColors.subText,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: PluginItemCard(
                        onTap: () {},
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
