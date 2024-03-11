import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/line_item_model.dart';
import 'package:nuforce/app/modules/new_orders/controllers/invoice_controller.dart';
import 'package:nuforce/app/modules/new_orders/widgets/line_item_view_tile.dart';
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
  List<LineItem> items = [
    const LineItem(
      id: 1,
      itemType: 'itemType',
      name: 'name',
      description: 'description',
      unitPrice: 'unitPrice',
      discount: 'discount',
      quantity: 'quantity',
      totoalBill: 'totoalBill',
    ),
    const LineItem(
      id: 1,
      itemType: 'itemType',
      name: 'name',
      description: 'description',
      unitPrice: 'unitPrice',
      discount: 'discount',
      quantity: 'quantity',
      totoalBill: 'totoalBill',
    ),
    const LineItem(
      id: 1,
      itemType: 'itemType',
      name: 'name',
      description: 'description',
      unitPrice: 'unitPrice',
      discount: 'discount',
      quantity: 'quantity',
      totoalBill: 'totoalBill',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceController>(
      builder: (controller) {
        if (controller.lineItems.isEmpty) {
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
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: LineItemViewTile(
                      index: index,
                      item: items[index],
                    ),
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
            onPressed: () {},
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
