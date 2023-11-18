import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/controllers/promotion_items_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_tabbar_filled.dart';

class PromotionMiniTabs extends StatelessWidget {
  const PromotionMiniTabs({
    super.key,
    required this.controller,
  });

  final PromotionItemsController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Obx(
            () => CustomTabBarFilled(
              isSelected: controller.miniTabEnum.value == PromotionTabEnum.coupon,
              onTap: () {
                controller.miniTabEnum.value = PromotionTabEnum.coupon;
              },
              text: 'Coupon',
              isMini: true,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CustomTabBarFilled(
              isSelected: controller.miniTabEnum.value == PromotionTabEnum.discount,
              onTap: () {
                controller.miniTabEnum.value = PromotionTabEnum.discount;
              },
              text: 'Discount',
              isMini: true,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CustomTabBarFilled(
              isSelected: controller.miniTabEnum.value == PromotionTabEnum.offer,
              onTap: () {
                controller.miniTabEnum.value = PromotionTabEnum.offer;
              },
              text: 'Offer',
              isMini: true,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CustomTabBarFilled(
              isSelected: controller.miniTabEnum.value == PromotionTabEnum.gift,
              onTap: () {
                controller.miniTabEnum.value = PromotionTabEnum.gift;
              },
              text: 'Gift',
              isMini: true,
            ),
          ),
        ),
      ],
    );
  }
}
