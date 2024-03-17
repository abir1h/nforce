import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/line_item/controllers/line_item_controller.dart';
import 'package:nuforce/app/modules/new_orders/controllers/invoice_controller.dart';
import 'package:nuforce/app/modules/new_orders/widgets/line_item_view_tile.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/app/shared/widgets/details_with_header_skleton.dart';
import 'package:nuforce/app/utils/colors.dart';

class InvoiceLineItemsWidget extends StatefulWidget {
  const InvoiceLineItemsWidget({
    super.key,
  });

  @override
  State<InvoiceLineItemsWidget> createState() => _InvoiceLineItemsWidgetState();
}

class _InvoiceLineItemsWidgetState extends State<InvoiceLineItemsWidget> {
  @override
  void initState() {
    super.initState();
    if (!LineItemController().initialized) {
      Get.put(LineItemController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceController>(
      builder: (controller) {
        if (controller.cartItems.isEmpty) {
          return const EmptyLineItemView();
        }
        return DetailsWithHeaderSkleton(
          controller: ExpandableController(),
          header: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Line Items',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
          body: Column(
            children: [
              GetBuilder<InvoiceController>(
                builder: (controller) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.cartItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: LineItemViewTile(
                          index: index,
                          item: controller.cartItems[index],
                        ),
                      );
                    },
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '+ Add line item',
                        style: TextStyle(
                          color: AppColors.primaryBlue1,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '+ Add Package',
                        style: TextStyle(
                          color: AppColors.primaryBlue1,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class EmptyLineItemView extends StatelessWidget {
  const EmptyLineItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white1,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [
          Text(
            'Line Items',
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.LINE_ITEM);
            },
            child: Text(
              'Add line item',
              style: TextStyle(
                color: AppColors.primaryBlue1,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 3),
          TextButton(
            onPressed: () {},
            child: Text(
              'Add package',
              style: TextStyle(
                color: AppColors.primaryBlue1,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
