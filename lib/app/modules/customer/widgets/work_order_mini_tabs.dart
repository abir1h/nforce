import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/controllers/customer_work_order_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_tabbar_filled.dart';
import 'package:nuforce/main.dart';

class WorkOrderMinMiniTabs extends StatefulWidget {
  const WorkOrderMinMiniTabs({super.key});

  @override
  State<WorkOrderMinMiniTabs> createState() => _WorkOrderMinMiniTabsState();
}

class _WorkOrderMinMiniTabsState extends State<WorkOrderMinMiniTabs> {
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
    return GetBuilder<CustomerWorkOrderController>(
      builder: (controller) {
        return SizedBox(
          width: width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == WorkOrderTabEnum.overview,
                  onTap: () {
                    controller.updateTabEnum(WorkOrderTabEnum.overview);
                  },
                  text: 'Overview',
                  isMini: true,
                ),
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == WorkOrderTabEnum.invoices,
                  onTap: () {
                    controller.updateTabEnum(WorkOrderTabEnum.invoices);
                  },
                  text: 'Invoices',
                  isMini: true,
                ),
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == WorkOrderTabEnum.schedules,
                  onTap: () {
                    controller.updateTabEnum(WorkOrderTabEnum.schedules);
                  },
                  text: 'Schedules',
                  isMini: true,
                ),
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == WorkOrderTabEnum.locations,
                  onTap: () {
                    controller.updateTabEnum(WorkOrderTabEnum.locations);
                  },
                  text: 'Locations',
                  isMini: true,
                ),
                CustomTabBarFilled(
                  isSelected: controller.tabEnum == WorkOrderTabEnum.policies,
                  onTap: () {
                    controller.updateTabEnum(WorkOrderTabEnum.policies);
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
