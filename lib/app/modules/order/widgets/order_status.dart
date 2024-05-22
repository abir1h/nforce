import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/shared/widgets/colored_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/main.dart';

enum OrderStatus {
  pending,
  completed,
  active,
  cancelled,
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.orderStatus,
    required this.onTap,
  });

  final OrderStatus orderStatus;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.white1,
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Aaron Taylor',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: isIpad ? 12.sp : 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ColoredButton(
                  onTap: () {},
                  height: 24.h,
                  text: switch (orderStatus) {
                    OrderStatus.pending => 'Pending',
                    OrderStatus.completed => 'Completed',
                    OrderStatus.active => 'Active',
                    OrderStatus.cancelled => 'Cancelled',
                  },
                  textColor: switch (orderStatus) {
                    OrderStatus.pending => AppColors.yellow,
                    OrderStatus.completed => AppColors.green,
                    OrderStatus.active => AppColors.blue,
                    OrderStatus.cancelled => AppColors.red,
                  },
                ),
              ],
            ),
            5.h.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'WOAT351',
                  style: TextStyle(
                    color: AppColors.nutralBlack2,
                    fontSize: isIpad ? 10.sp : 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '\$500.00',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: isIpad ? 10.sp : 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            5.h.vSpace,
            Text(
              '25 Jan 2024',
              style: TextStyle(
                color: AppColors.nutralBlack2,
                fontSize: isIpad ? 10.sp : 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            5.h.vSpace,
            Text(
              '1621 Ocean Pearl Rd Corolla, North Carolina (NC), 27927',
              style: TextStyle(
                color: AppColors.nutralBlack2,
                fontSize: isIpad ? 10.sp : 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            5.h.vSpace,
            const Divider(color: AppColors.nutralBlack3),
            5.h.vSpace,
            Row(
              children: [
                for (int i = 0; i < 2; i++) ...[
                  Container(
                    height: 40.h,
                    width: 48.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: AppColors.nutralBlack3,
                    ),
                  ),
                  5.w.hSpace,
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
