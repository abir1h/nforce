import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/models/work_order_success_model.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/work_order/controllers/work_order_controller.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';
import '../widgets/work_order_card.dart';

class WorkOrderView extends GetView<WorkOrderController> {
  const WorkOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightShade,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.w,
              ),
              decoration: const BoxDecoration(color: AppColors.white1),
              child: Row(
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Report',
                        style: CustomTextStyle.heading4.copyWith(
                          color: AppColors.nutralBlack1,
                          fontWeight: FontWeight.w600,
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: ' (Dashboard & Colander )',
                            style: CustomTextStyle.heading4.copyWith(
                              color: AppColors.nutralBlack1,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    Assets.images.svg.calendarReport,
                    height: isIpad ? 35.h : null,
                  )
                ],
              ),
            ),
            SizedBox(height: 16.h),
            WorkOrderCard(
              onPressed: () => Get.toNamed(
                Routes.WORK_ORDER_VIEW,
                arguments: Invoice(),
              ),
            ),
            WorkOrderCard(
              onPressed: () => Get.toNamed(Routes.WORK_ORDER_VIEW),
            ),
            WorkOrderCard(
              onPressed: () => Get.toNamed(Routes.WORK_ORDER_VIEW),
            ),
            WorkOrderCard(
              onPressed: () => Get.toNamed(Routes.WORK_ORDER_VIEW),
            ),
            WorkOrderCard(
              onPressed: () => Get.toNamed(Routes.WORK_ORDER_VIEW),
            ),
            WorkOrderCard(
              onPressed: () => Get.toNamed(Routes.WORK_ORDER_VIEW),
            ),
            SizedBox(
              height: 32.h,
            ),
          ],
        ).ifIpad,
      ),
    );
  }
}
