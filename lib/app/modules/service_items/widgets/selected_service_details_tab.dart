import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/controllers/service_items_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_tabbar_filled.dart';

class SelectedServiceDetailsTabs extends StatelessWidget {
  const SelectedServiceDetailsTabs({
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
              isSelected: controller.selectedTabEnum.value == SelectedServiceTabEnum.overview,
              onTap: () {
                controller.selectedTabEnum.value = SelectedServiceTabEnum.overview;
              },
              text: 'Overview',
              isMini: true,
            ),
          ),
          Obx(
            () => CustomTabBarFilled(
              isSelected: controller.selectedTabEnum.value == SelectedServiceTabEnum.subItems,
              onTap: () {
                controller.selectedTabEnum.value = SelectedServiceTabEnum.subItems;
              },
              text: 'Sub Items(3)',
              isMini: true,
            ),
          ),
          Obx(
            () => CustomTabBarFilled(
              isSelected: controller.selectedTabEnum.value == SelectedServiceTabEnum.settings,
              onTap: () {
                controller.selectedTabEnum.value = SelectedServiceTabEnum.settings;
              },
              text: 'Settings',
              isMini: true,
            ),
          ),
          Obx(
            () => CustomTabBarFilled(
              isSelected: controller.selectedTabEnum.value == SelectedServiceTabEnum.content,
              onTap: () {
                controller.selectedTabEnum.value = SelectedServiceTabEnum.content;
              },
              text: 'Content',
              isMini: true,
            ),
          ),
        ],
      ),
    );
  }
}
