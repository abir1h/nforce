import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/line_item_model.dart';
import 'package:nuforce/app/modules/new_orders/controllers/invoice_controller.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class LineItemTile extends StatefulWidget {
  const LineItemTile({
    required this.item,
    super.key,
  });
  final LineItem item;

  @override
  State<LineItemTile> createState() => _LineItemTileState();
}

class _LineItemTileState extends State<LineItemTile> {
  LineItem? newItem;

  int count = 1;
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    newItem = widget.item;
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.tableBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.item.unitCost,
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Unit Rate \$${widget.item.unitCost}',
            style: TextStyle(
              color: AppColors.nutralBlack2,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          5.h.vSpace,
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: AppColors.white2),
                  ),
                  child: TextField(
                    controller: _amountController,
                    style: TextStyle(
                      color: AppColors.nutralBlack2,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Edit amount',
                      hintStyle: TextStyle(
                        color: AppColors.nutralBlack2,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (count > 1) {
                    setState(() {
                      count--;
                    });
                  }
                },
                child: const Icon(
                  Icons.remove_circle_outline,
                  color: AppColors.white4,
                ),
              ),
              10.w.hSpace,
              Text(
                '$count',
                style: TextStyle(
                  color: AppColors.nutralBlack2,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              10.w.hSpace,
              GestureDetector(
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
                child: const Icon(
                  Icons.add_circle_outline,
                  color: AppColors.primaryBlue1,
                ),
              ),
              10.w.hSpace,
              Expanded(
                child: PrimaryButton(
                  height: 24,
                  onPressed: () {
                    if (newItem == null) return;

                    final invoiceController = Get.find<InvoiceController>();

                    if (_amountController.text.isNotEmpty) {
                      newItem = newItem!.copyWith(
                        // unitPrice: _amountController.text,
                        unitCost: _amountController.text,
                      );
                    }

                    for (int i = 0; i < count; i++) {
                      invoiceController.addLineItem(newItem!);
                    }
                    // Fluttertoast.showToast(msg: '$count ${newItem!.name} added to invoice');
                  },
                  text: 'Confirm',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
