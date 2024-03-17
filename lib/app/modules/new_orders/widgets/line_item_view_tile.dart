import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/model/line_item_model.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class LineItemViewTile extends StatelessWidget {
  const LineItemViewTile({
    required this.index,
    required this.item,
    super.key,
  });
  final int index;
  final LineItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: AppColors.primaryBlue1.withOpacity(0.3),
          ),
          child: Text(
            (index + 1).toString().padLeft(2, '0'),
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        8.w.hSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Text(
            //   'Pest Control > Line Items',
            //   style: TextStyle(
            //     color: AppColors.nutralBlack2,
            //     fontSize: 10.sp,
            //     fontWeight: FontWeight.w400,
            //   ),
            // ),
            Text(
              'Quantity: 1',
              style: TextStyle(
                color: AppColors.nutralBlack2,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Unit: \$${item.unitPrice}',
              style: TextStyle(
                color: AppColors.nutralBlack2,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          '\$${item.unitPrice}',
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
