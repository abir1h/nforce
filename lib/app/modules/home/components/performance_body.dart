import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/components/colored_checkbox_with_title.dart';
import 'package:nuforce/app/modules/home/components/custom_chart.dart';
import 'package:nuforce/app/modules/home/components/performance_card_widget.dart';
import 'package:nuforce/app/modules/home/controllers/home_controller.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class PerformanceBody extends GetView<HomeController> {
  const PerformanceBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Last Update 10:30 PM',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.nutralBlack1,
                  ),
                ),
                Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldBackground,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.inactiveColor),
                  ),
                  child: DropdownButton(
                    underline: const SizedBox(),
                    isExpanded: false,
                    icon: const Icon(Icons.arrow_drop_down, color: AppColors.inactiveColor),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.subText,
                    ),
                    items: ['Today', 'Yesterday', 'Last 7 Days', 'Last 30 Days']
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style:  TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.subText,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    value: 'Today',
                    onChanged: (newValue) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Row(
              children: [
                Expanded(
                  child: PerformanceCardWidget(
                    mainPercentage: '12.7%',
                    subPercentage: '+2.3%',
                    title: 'Pest',
                    color: AppColors.green,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: PerformanceCardWidget(
                    mainPercentage: '65.4%',
                    subPercentage: '+3.2%',
                    title: 'Safer',
                    color: AppColors.primaryBlue1,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: PerformanceCardWidget(
                    mainPercentage: '99.3%',
                    subPercentage: '+5.3%',
                    title: 'Cleaner',
                    color: AppColors.primaryBlue2,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: PerformanceCardWidget(
                    mainPercentage: '86.7%',
                    subPercentage: '+1.1%',
                    title: 'On Time',
                    color: AppColors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(thickness: 1),
            const SizedBox(height: 15),
            SizedBox(
              width: width,
              height: 140,
              child: Obx(
                () => CustomChart(
                  lineBarsData: [
                    if (controller.chartController.isSmootherSelected.value) controller.chartController.smootherChartData,
                    if (controller.chartController.isSaferSelected.value) controller.chartController.saferChartData,
                    if (controller.chartController.isCleanerSelected.value) controller.chartController.cleanerChartData,
                    if (controller.chartController.isOnTimeSelected.value) controller.chartController.onTimeChartData,
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: width - 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => ColoredCheckboxWithTitle(
                      color: AppColors.green,
                      isSelected: controller.chartController.isSmootherSelected.value,
                      onChanged: (p0) => controller.chartController.isSmootherSelected.value = p0!,
                      title: 'Smoother',
                    ),
                  ),
                  Obx(
                    () => ColoredCheckboxWithTitle(
                      color: AppColors.primaryBlue1,
                      isSelected: controller.chartController.isSaferSelected.value,
                      onChanged: (p0) => controller.chartController.isSaferSelected.value = p0!,
                      title: 'Safer',
                    ),
                  ),
                  Obx(
                    () => ColoredCheckboxWithTitle(
                      color: AppColors.primaryBlue2,
                      isSelected: controller.chartController.isCleanerSelected.value,
                      onChanged: (p0) => controller.chartController.isCleanerSelected.value = p0!,
                      title: 'Cleaner',
                    ),
                  ),
                  Obx(
                    () => ColoredCheckboxWithTitle(
                      color: AppColors.orange,
                      isSelected: controller.chartController.isOnTimeSelected.value,
                      onChanged: (p0) => controller.chartController.isOnTimeSelected.value = p0!,
                      title: 'On Time',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
