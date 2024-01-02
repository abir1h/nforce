import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class InvoiceTile extends StatelessWidget {
  const InvoiceTile({
    required this.isHighlighted,
    required this.title,
    required this.price,
    required this.name,
    required this.invoiceDate,
    required this.status,
    required this.statusColor,
    super.key,
  });
  final bool isHighlighted;
  final String title;
  final String price;
  final String name;
  final String invoiceDate;
  final String status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isHighlighted ? AppColors.inactiveColor.withOpacity(0.1) : AppColors.white1,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.inactiveColor.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: CustomTextStyle.heading5.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.nutralBlack1,
                ),
              ),
              Text(
                '\$$price',
                style: CustomTextStyle.heading5.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.nutralBlack1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Name',
                    style: CustomTextStyle.paragraphExtraSmall.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.subText,
                    ),
                  ),
                  Text(
                    name,
                    style: CustomTextStyle.heading5.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.nutralBlack1,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Invoice Date',
                    style: CustomTextStyle.paragraphExtraSmall.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.subText,
                    ),
                  ),
                  Text(
                    invoiceDate,
                    style: CustomTextStyle.heading5.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.nutralBlack1,
                    ),
                  ),
                ],
              ),
              Container(
                height: 34,
                width: 76,
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    status,
                    style: CustomTextStyle.heading5.copyWith(
                      fontWeight: FontWeight.w400,
                      color: statusColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
