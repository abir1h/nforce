import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/controllers/home_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_tabbar.dart';
import 'package:nuforce/main.dart';

class HomeMiniTabs extends StatelessWidget {
  const HomeMiniTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SizedBox(
          width: width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 100.w,
                  child: CustomTabBar(
                    isSelected: controller.miniTabEnum == MiniTabIndexEnum.today,
                    onTap: () {
                      controller.updateMiniTabEnum(MiniTabIndexEnum.today);
                    },
                    text: 'Today',
                    isMini: true,
                  ),
                ),
                SizedBox(
                  width: 100.w,
                  child: CustomTabBar(
                    isSelected: controller.miniTabEnum == MiniTabIndexEnum.actions,
                    onTap: () {
                      controller.updateMiniTabEnum(MiniTabIndexEnum.actions);
                    },
                    text: 'Actions',
                    isMini: true,
                  ),
                ),
                SizedBox(
                  width: 150.w,
                  child: CustomTabBar(
                    isSelected: controller.miniTabEnum == MiniTabIndexEnum.performance,
                    onTap: () {
                      controller.updateMiniTabEnum(MiniTabIndexEnum.performance);
                    },
                    text: 'Performance',
                    isMini: true,
                  ),
                ),
                SizedBox(
                  width: 100.w,
                  child: CustomTabBar(
                    isSelected: controller.miniTabEnum == MiniTabIndexEnum.invoices,
                    onTap: () {
                      controller.updateMiniTabEnum(MiniTabIndexEnum.invoices);
                    },
                    text: 'Invoices',
                    isMini: true,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
