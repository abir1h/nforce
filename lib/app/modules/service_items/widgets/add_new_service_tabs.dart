import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/controllers/add_new_service_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_tabbar_filled.dart';

class AddNewServiceTabs extends StatelessWidget {
  const AddNewServiceTabs({
    super.key,
    required this.controller,
  });

  final AddNewServiceController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Obx(
            () => CustomTabBarFilled(
              isSelected: controller.selectedServiceTabEnum.value == AddNewServiceTabEnum.overview,
              onTap: () {
                controller.selectedServiceTabEnum.value = AddNewServiceTabEnum.overview;
              },
              text: 'Overview',
              isMini: true,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CustomTabBarFilled(
              isSelected: controller.selectedServiceTabEnum.value == AddNewServiceTabEnum.addSubItems,
              onTap: () {
                controller.selectedServiceTabEnum.value = AddNewServiceTabEnum.addSubItems;
              },
              text: 'Add Sub Items',
              isMini: true,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CustomTabBarFilled(
              isSelected: controller.selectedServiceTabEnum.value == AddNewServiceTabEnum.content,
              onTap: () {
                controller.selectedServiceTabEnum.value = AddNewServiceTabEnum.content;
              },
              text: 'Content',
              isMini: true,
            ),
          ),
        ),
      ],
    );
  }
}
