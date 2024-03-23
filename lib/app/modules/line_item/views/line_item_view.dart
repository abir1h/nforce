import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/line_item/views/add_new_line_item.dart';
import 'package:nuforce/app/modules/line_item/views/line_items_list.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_tabbar_filled.dart';

import '../controllers/line_item_controller.dart';

class LineItemView extends StatefulWidget {
  const LineItemView({Key? key}) : super(key: key);

  @override
  State<LineItemView> createState() => _LineItemViewState();
}

class _LineItemViewState extends State<LineItemView> {
  @override
  void initState() {
    super.initState();
    if (LineItemController().initialized) {
      Get.find<LineItemController>();
    } else {
      Get.put(LineItemController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Line Items'),
      body: SafeArea(
        child: Column(
          children: [
            GetBuilder<LineItemController>(
              builder: (lineItemController) {
                return Row(
                  children: [
                    Expanded(
                      child: CustomTabBarFilled(
                        isSelected: lineItemController.selectedTab == LineItemTab.lineItems,
                        onTap: () {
                          lineItemController.setSelectedTab(LineItemTab.lineItems);
                        },
                        text: 'Line Items',
                        isMini: true,
                      ),
                    ),
                    Expanded(
                      child: CustomTabBarFilled(
                        isSelected: lineItemController.selectedTab == LineItemTab.findItems,
                        onTap: () {
                          lineItemController.setSelectedTab(LineItemTab.findItems);
                        },
                        text: 'Find Items',
                        isMini: true,
                      ),
                    ),
                    Expanded(
                      child: CustomTabBarFilled(
                        isSelected: lineItemController.selectedTab == LineItemTab.addNew,
                        onTap: () {
                          lineItemController.setSelectedTab(LineItemTab.addNew);
                        },
                        text: 'Add New',
                        isMini: true,
                      ),
                    ),
                  ],
                );
              },
            ),
            Expanded(
              child: GetBuilder<LineItemController>(
                builder: (controller) {
                  if (controller.selectedTab == LineItemTab.lineItems) {
                    return const LineItemsList();
                  } else if (controller.selectedTab == LineItemTab.findItems) {
                    return Container();
                  } else {
                    return const AddNewLineItem();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
