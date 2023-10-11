import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/controllers/service_items_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_tabbar_filled.dart';

class ServiceMiniTabs extends StatelessWidget {
  const ServiceMiniTabs({
    super.key,
    required this.controller,
  });

  final ServiceItemsController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Obx(
            () => CustomTabBarFilled(
              isSelected: controller.miniTabEnum.value == ServiceTabEnum.all,
              onTap: () {
                controller.miniTabEnum.value = ServiceTabEnum.all;
              },
              text: 'All',
              isMini: true,
            ),
          ),
          Obx(
            () => CustomTabBarFilled(
              isSelected: controller.miniTabEnum.value == ServiceTabEnum.service,
              onTap: () {
                controller.miniTabEnum.value = ServiceTabEnum.service;
              },
              text: 'Service',
              isMini: true,
            ),
          ),
          Obx(
            () => CustomTabBarFilled(
              isSelected: controller.miniTabEnum.value == ServiceTabEnum.material,
              onTap: () {
                controller.miniTabEnum.value = ServiceTabEnum.material;
              },
              text: 'Material',
              isMini: true,
            ),
          ),
          Obx(
            () => CustomTabBarFilled(
              isSelected: controller.miniTabEnum.value == ServiceTabEnum.package,
              onTap: () {
                controller.miniTabEnum.value = ServiceTabEnum.package;
              },
              text: 'Package',
              isMini: true,
            ),
          ),
          Obx(
            () => CustomTabBarFilled(
              isSelected: controller.miniTabEnum.value == ServiceTabEnum.subscription,
              onTap: () {
                controller.miniTabEnum.value = ServiceTabEnum.subscription;
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
