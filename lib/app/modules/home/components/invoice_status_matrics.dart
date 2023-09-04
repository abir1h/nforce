import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/main.dart';
class InvoiceStatusMatrics extends StatelessWidget {
  const InvoiceStatusMatrics({
    super.key,
    required this.topValue,
    required this.amount,
    required this.status,
    required this.color,
  });
  final String topValue;
  final String amount;
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Text(
            topValue,
            style: CustomTextStyle.heading3.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '\$${amount}K',
            style: CustomTextStyle.heading3.copyWith(
              color: AppColors.subText,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Container(
              height: 1.5,
              width: width,
              color: color.withOpacity(0.2),
            ),
          ),
          Text(
            status,
            style: CustomTextStyle.heading5.copyWith(
              color: AppColors.subText,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
