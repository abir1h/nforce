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
              isSelected: controller.miniTabEnum.value == MiniTabIndexEnum.today,
              onTap: () {
                controller.miniTabEnum.value = MiniTabIndexEnum.today;
              },
              text: 'Today',
              isMini: true,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CustomTabBar(
              isSelected: controller.miniTabEnum.value == MiniTabIndexEnum.actions,
              onTap: () {
                controller.miniTabEnum.value = MiniTabIndexEnum.actions;
              },
              text: 'Actions',
              isMini: true,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CustomTabBar(
              isSelected: controller.miniTabEnum.value == MiniTabIndexEnum.performance,
              onTap: () {
                controller.miniTabEnum.value = MiniTabIndexEnum.performance;
              },
              text: 'Performance',
              isMini: true,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CustomTabBar(
              isSelected: controller.miniTabEnum.value == MiniTabIndexEnum.invoices,
              onTap: () {
                controller.miniTabEnum.value = MiniTabIndexEnum.invoices;
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
