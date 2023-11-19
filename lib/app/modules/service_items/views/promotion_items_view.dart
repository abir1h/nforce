import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_items/controllers/promotion_items_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/landing_page_url_text_box.dart';
import 'package:nuforce/app/modules/service_items/widgets/promotion_mini_tabs.dart';
import 'package:nuforce/app/modules/service_items/widgets/textbox_with_button_inside.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class PromotionItemsListView extends GetView<PromotionItemsController> {
  const PromotionItemsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => CustomAppbarMinimal(
                title: controller.miniTabEnum.value == PromotionTabEnum.coupon
                    ? 'Coupon'
                    : controller.miniTabEnum.value == PromotionTabEnum.discount
                        ? 'Discount'
                        : controller.miniTabEnum.value == PromotionTabEnum.offer
                            ? 'Offer'
                            : controller.miniTabEnum.value == PromotionTabEnum.gift
                                ? 'Gift'
                                : '',
                trailing: [
                  GestureDetector(
                    onTap: controller.miniTabEnum.value == PromotionTabEnum.coupon
                        ? () {}
                        : controller.miniTabEnum.value == PromotionTabEnum.discount
                            ? () {}
                            : controller.miniTabEnum.value == PromotionTabEnum.offer
                                ? () {}
                                : controller.miniTabEnum.value == PromotionTabEnum.gift
                                    ? () {}
                                    : () {},
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          '+ Add',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PromotionMiniTabs(controller: controller),
            SizedBox(height: 15.sp),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Obx(
                  () => controller.miniTabEnum.value == PromotionTabEnum.coupon
                      ? Column(
                          children: [
                            TextboxWithButtonInside(
                              controller: TextEditingController(),
                            ),
                          ],
                        )
                      : controller.miniTabEnum.value == PromotionTabEnum.discount
                          ? const SizedBox()
                          : controller.miniTabEnum.value == PromotionTabEnum.offer
                              ? const SizedBox()
                              : controller.miniTabEnum.value == PromotionTabEnum.gift
                                  ? const SizedBox()
                                  : const SizedBox(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
