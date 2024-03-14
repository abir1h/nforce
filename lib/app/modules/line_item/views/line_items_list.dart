import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/line_item/controllers/line_item_controller.dart';
import 'package:nuforce/app/modules/line_item/views/line_item_tile.dart';
import 'package:nuforce/app/modules/new_orders/controllers/invoice_controller.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class LineItemsList extends StatelessWidget {
  const LineItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceController>(
      builder: (invoiceController) {
        return GetBuilder<LineItemController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.h.vSpace,
                  Text(
                    'Total Line Item (${controller.items.length})',
                    style: TextStyle(
                      color: AppColors.nutralBlack2,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  16.h.vSpace,
                  ListView.builder(
                    itemCount: controller.items.length,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      final item = controller.items[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: LineItemTile(item: item),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
