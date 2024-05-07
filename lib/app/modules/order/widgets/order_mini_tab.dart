import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/controllers/customer_work_order_controller.dart';
import 'package:nuforce/app/modules/order/controllers/order_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_tabbar_filled.dart';
import 'package:nuforce/main.dart';

class OrderMiniTabs extends StatefulWidget {
  const OrderMiniTabs({super.key});

  @override
  State<OrderMiniTabs> createState() => _OrderMiniTabsState();
}

class _OrderMiniTabsState extends State<OrderMiniTabs> {
  @override
  void initState() {
    super.initState();
    if (!CustomerWorkOrderController().initialized) {
      Get.put(CustomerWorkOrderController());
    } else {
      Get.find<CustomerWorkOrderController>();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (controller) {
        return SizedBox(
          width: width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == OrderTabEnum.overview,
                  onTap: () {
                    controller.updateTabEnum(OrderTabEnum.overview);
                  },
                  text: 'Overview',
                  isMini: true,
                ),
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == OrderTabEnum.invoices,
                  onTap: () {
                    controller.updateTabEnum(OrderTabEnum.invoices);
                  },
                  text: 'Invoices',
                  isMini: true,
                ),
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == OrderTabEnum.schedules,
                  onTap: () {
                    controller.updateTabEnum(OrderTabEnum.schedules);
                  },
                  text: 'Schedules',
                  isMini: true,
                ),
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == OrderTabEnum.locations,
                  onTap: () {
                    controller.updateTabEnum(OrderTabEnum.locations);
                  },
                  text: 'Locations',
                  isMini: true,
                ),
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == OrderTabEnum.policies,
                  onTap: () {
                    controller.updateTabEnum(OrderTabEnum.policies);
                  },
                  text: 'Policies',
                  isMini: true,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
