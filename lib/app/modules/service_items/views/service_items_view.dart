import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/components/service_button.dart';
import 'package:nuforce/app/modules/service_items/controllers/promotion_items_controller.dart';
import 'package:nuforce/app/modules/service_items/controllers/service_items_controller.dart';
import 'package:nuforce/app/modules/service_items/views/promotion_items_view.dart';
import 'package:nuforce/app/modules/service_items/views/service_items_list_view.dart';
import 'package:nuforce/app/modules/service_items/widgets/plugin_item_card.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

class ServiceItemsView extends GetView<ServiceItemsController> {
  const ServiceItemsView({super.key});
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
                        Get.to<void>(() => const ServiceItemsListView());
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
                        Get.to<void>(() => const ServiceItemsListView());
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
                        Get.to<void>(() => const ServiceItemsListView());
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
                        Get.to<void>(() => const ServiceItemsListView());
                        Future<void>.delayed(const Duration(milliseconds: 200)).then((value) {
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
                        Get.to<void>(() => const ServiceItemsListView());
                        Future<void>.delayed(const Duration(milliseconds: 200)).then((value) {
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
                  children: [
                    ServiceButton(
                      svgPath: Assets.images.svg.coupon,
                      title: 'Coupon',
                      onTap: () {
                        late PromotionItemsController controller;
                        if (!PromotionItemsController().initialized) {
                          controller = Get.put(PromotionItemsController());
                        }
                        controller.miniTabEnum.value = PromotionTabEnum.coupon;
                        Get.to<void>(() => const PromotionItemsListView());
                      },
                    ),
                    ServiceButton(
                      svgPath: Assets.images.svg.discount,
                      title: 'Discount',
                      onTap: () {
                        late PromotionItemsController controller;
                        if (!PromotionItemsController().initialized) {
                          controller = Get.put(PromotionItemsController());
                        }
                        controller.miniTabEnum.value = PromotionTabEnum.discount;
                        Get.to<void>(() => const PromotionItemsListView());
                      },
                    ),
                    ServiceButton(
                      svgPath: Assets.images.svg.offer,
                      title: 'Offer',
                      onTap: () {
                        late PromotionItemsController controller;
                        if (!PromotionItemsController().initialized) {
                          controller = Get.put(PromotionItemsController());
                        }
                        controller.miniTabEnum.value = PromotionTabEnum.offer;
                        Get.to<void>(() => const PromotionItemsListView());
                      },
                    ),
                    ServiceButton(
                      svgPath: Assets.images.svg.gift,
                      title: 'Gift',
                      onTap: () {
                        late PromotionItemsController controller;
                        if (!PromotionItemsController().initialized) {
                          controller = Get.put(PromotionItemsController());
                        }
                        controller.miniTabEnum.value = PromotionTabEnum.gift;
                        Get.to<void>(() => const PromotionItemsListView());
                      },
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
                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
