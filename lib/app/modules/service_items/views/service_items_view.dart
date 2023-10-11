import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/components/service_button.dart';
import 'package:nuforce/app/modules/service_items/views/service_items_list_view.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

import '../controllers/service_items_controller.dart';

class ServiceItemsView extends GetView<ServiceItemsController> {
  const ServiceItemsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: 'Service Items',
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.start,
                    children: [
                      ServiceButton(
                        svgPath: Assets.images.svg.service,
                        title: 'Service',
                        onTap: () {
                          Get.to(() => const ServiceItemsListView());
                        },
                      ),
                      ServiceButton(
                        svgPath: Assets.images.svg.material,
                        title: 'Material',
                        onTap: () {},
                      ),
                      ServiceButton(
                        svgPath: Assets.images.svg.package,
                        title: 'Package',
                        onTap: () {},
                      ),
                      ServiceButton(
                        svgPath: Assets.images.svg.subscription,
                        title: 'Subscription',
                        onTap: () {},
                      ),
                      ServiceButton(
                        svgPath: Assets.images.svg.addons,
                        title: 'Addons',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.sp),
              Padding(
                padding: EdgeInsets.only(left: 20.sp),
                child: Text(
                  'Promotions',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.start,
                    children: [
                      ServiceButton(
                        svgPath: Assets.images.svg.coupon,
                        title: 'Coupon',
                        onTap: () {},
                      ),
                      ServiceButton(
                        svgPath: Assets.images.svg.discount,
                        title: 'Discount',
                        onTap: () {},
                      ),
                      ServiceButton(
                        svgPath: Assets.images.svg.offer,
                        title: 'Offer',
                        onTap: () {},
                      ),
                      ServiceButton(
                        svgPath: Assets.images.svg.gift,
                        title: 'Gift',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
