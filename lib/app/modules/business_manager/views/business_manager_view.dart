import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/views/business_manager_settings_view.dart';
import 'package:nuforce/app/modules/business_manager/views/organization_view.dart';
import 'package:nuforce/app/modules/business_manager/widgets/business_manager_daily_sales_curve.dart';
import 'package:nuforce/app/modules/business_manager/widgets/business_manager_money_matrics.dart';
import 'package:nuforce/app/modules/business_manager/widgets/custome_pie_chart.dart';
import 'package:nuforce/app/modules/home/components/service_button.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

import '../controllers/business_manager_controller.dart';

class BusinessManagerView extends GetView<BusinessManagerController> {
  const BusinessManagerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: 'Business Manager',
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ServiceButton(
                      svgPath: Assets.images.svg.organization,
                      title: 'Organization',
                      onTap: () {
                        Get.to(() => const OrganizationView());
                      },
                    ),
                    ServiceButton(
                      svgPath: Assets.images.svg.customer,
                      title: 'Customer',
                      onTap: () {},
                    ),
                    ServiceButton(
                      svgPath: Assets.images.svg.accounts,
                      title: 'Accounts',
                      onTap: () {},
                    ),
                    ServiceButton(
                      svgPath: Assets.images.svg.settings,
                      title: 'Settings',
                      onTap: () {
                        Get.to(() => const BusinessManagerSettingsView());
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                const SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      BusinessManagerMoneyMatrics(
                        amount: '+\$17,800',
                        title: 'Services Profit',
                        type: 'Average weekly Profit',
                      ),
                      SizedBox(width: 10),
                      BusinessManagerMoneyMatrics(
                        amount: '+\$17,800',
                        title: 'Work Orders',
                        type: 'Weekly Customer Orders',
                      ),
                      SizedBox(width: 10),
                      BusinessManagerMoneyMatrics(
                        amount: '+\$17,800',
                        title: 'Missed Leads',
                        type: 'Failed to scheudle',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                BusinessManagerDailySalesCurve(
                  title: 'Daily Sales',
                  details: 'Check out each column for more details',
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 4,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                    color: AppColors.white1,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Commission Shared',
                                  style: TextStyle(
                                    color: AppColors.nutralBlack1,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Profit shared as commission',
                                  style: TextStyle(
                                    color: AppColors.nutralBlack1,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Obx(
                              () => CustomDropdownButton(
                                items: ['1 day', '7 days', '1 month', '1 year'].map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                        color: AppColors.subText,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                hint: 'Select duration',
                                onChanged: (val) {
                                  controller.selectedValue.value = val.toString();
                                },
                                value: controller.selectedValue.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(
                        height: 150,
                        child: CustomPieChartWidget(),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
