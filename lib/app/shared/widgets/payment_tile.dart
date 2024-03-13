import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/gen/assets.gen.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.iconSvgPath,
    this.cardNumber,
    this.trailing,
  });

  final VoidCallback onTap;
  final String title;
  final String iconSvgPath;
  final String? cardNumber;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(color: AppColors.tableBorder),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue3,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: SvgPicture.asset(Assets.images.svg.paymentOptions),
            ),
            10.w.hSpace,
            Text(
              title,
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            if (cardNumber != null) ...[
              5.w.hSpace,
              Text(
                cardNumber!,
                style: TextStyle(
                  color: AppColors.nutralBlack2,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
            const Spacer(),
            trailing ?? SvgPicture.asset(Assets.images.svg.arrowRight),
            5.w.hSpace,
          ],
        ),
      ),
    );
  }
}
