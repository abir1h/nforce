import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/controllers/home_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_tabbar.dart';

class HomeMiniTabs extends StatelessWidget {
  const HomeMiniTabs({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Obx(
            () => CustomTabBar(
              isSelected: controller.miniTabIndex.value == MiniTabIndexEnum.today,
              onTap: () {
                controller.miniTabIndex.value = MiniTabIndexEnum.today;
              },
              text: 'Today',
              isMini: true,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CustomTabBar(
              isSelected: controller.miniTabIndex.value == MiniTabIndexEnum.actions,
              onTap: () {
                controller.miniTabIndex.value = MiniTabIndexEnum.actions;
              },
              text: 'Actions',
              isMini: true,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CustomTabBar(
              isSelected: controller.miniTabIndex.value == MiniTabIndexEnum.performance,
              onTap: () {
                controller.miniTabIndex.value = MiniTabIndexEnum.performance;
              },
              text: 'Performance',
              isMini: true,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CustomTabBar(
              isSelected: controller.miniTabIndex.value == MiniTabIndexEnum.invoices,
              onTap: () {
                controller.miniTabIndex.value = MiniTabIndexEnum.invoices;
              },
              text: 'Invoices',
              isMini: true,
            ),
          ),
        ),
      ],
    );
  }
}
