import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class MatrixWidget extends StatelessWidget {
  const MatrixWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: width,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: NumberTextAmountMatrics(
                amount: '100K',
                number: '28',
                color: AppColors.lightOrange,
                title: 'Total',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: NumberTextAmountMatrics(
                amount: '23K',
                number: '29',
                color: AppColors.lightBlue,
                title: 'To go',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: NumberTextAmountMatrics(
                amount: '4K',
                number: '30',
                color: AppColors.lightGreen,
                title: 'Active',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: NumberTextAmountMatrics(
                amount: '4K',
                number: '31',
                color: AppColors.lightPink,
                title: 'Completed',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NumberTextAmountMatrics extends StatelessWidget {
  const NumberTextAmountMatrics({
    super.key,
    required this.color,
    required this.number,
    required this.title,
    required this.amount,
  });

  final Color color;
  final String number;
  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 46.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: color,
          ),
          child: Center(
            child: Text(
              number,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontSize: isIpad ? 14.sp : 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isIpad ? 8.sp : 10.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.subText,
          ),
        ),
        Text(
          '\$$amount',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isIpad ? 10.sp : 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.nutralBlack1,
          ),
        ),
      ],
    );
  }
}
