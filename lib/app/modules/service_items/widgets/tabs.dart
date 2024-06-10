import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/controllers/service_items_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_tabbar_filled.dart';

class ServiceMiniTabs extends StatelessWidget {
  const ServiceMiniTabs({
    required this.controller,
    super.key,
  });

  final ServiceItemsController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: controller.scrollController,
      child: Row(
        children: [
          Obx(
            () => CustomTabBarFilled(
              isSelected: controller.miniTabEnum.value == ServiceTabEnum.all,
              onTap: () {
                controller.miniTabEnum.value = ServiceTabEnum.all;
                controller
                    .getServiceCategoriesByTab(controller.miniTabEnum.value);
                controller.dataLoaded=false;
              },
              text: 'All',
              isMini: true,
            ),
          ),
          Obx(
            () => CustomTabBarFilled(
              isSelected:
                  controller.miniTabEnum.value == ServiceTabEnum.service,
              onTap: () {
                controller.miniTabEnum.value = ServiceTabEnum.service;
                controller
                    .getServiceCategoriesByTab(controller.miniTabEnum.value);                controller.dataLoaded=false;

              },
              text: 'Service',
              isMini: true,
            ),
          ),
          Obx(
            () => CustomTabBarFilled(
              isSelected:
                  controller.miniTabEnum.value == ServiceTabEnum.material,
              onTap: () {
                controller.miniTabEnum.value = ServiceTabEnum.material;
                controller
                    .getServiceCategoriesByTab(controller.miniTabEnum.value);                controller.dataLoaded=false;

              },
              text: 'Material',
              isMini: true,
            ),
          ),
          Obx(
            () => CustomTabBarFilled(
              isSelected:
                  controller.miniTabEnum.value == ServiceTabEnum.package,
              onTap: () {
                controller.miniTabEnum.value = ServiceTabEnum.package;
                controller
                    .getServiceCategoriesByTab(controller.miniTabEnum.value);                controller.dataLoaded=false;

              },
              text: 'Package',
              isMini: true,
            ),
          ),
          Obx(
            () => CustomTabBarFilled(
              isSelected:
                  controller.miniTabEnum.value == ServiceTabEnum.subscription,
              onTap: () {
                controller.miniTabEnum.value = ServiceTabEnum.subscription;
                controller
                    .getServiceCategoriesByTab(controller.miniTabEnum.value);                controller.dataLoaded=false;

              },
              text: 'Subscription',
              isMini: true,
            ),
          ),
          Obx(
            () => CustomTabBarFilled(
              isSelected: controller.miniTabEnum.value == ServiceTabEnum.addons,
              onTap: () {
                controller.miniTabEnum.value = ServiceTabEnum.addons;
                controller
                    .getServiceCategoriesByTab(controller.miniTabEnum.value);                controller.dataLoaded=false;

              },
              text: 'Addons',
              isMini: true,
            ),
          ),
        ],
      ),
    );
  }
}
