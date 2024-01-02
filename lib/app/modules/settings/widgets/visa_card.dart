import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/subscriptions/controller/subscription_controller.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class VisaCard extends StatelessWidget {
  final String cardName;
  final String cardNumber;
  final Widget trailling;
  final VoidCallback onPressed;
  final Color? bgColor;
  final Color? borderColor;

  const VisaCard({
    required this.cardName,
    required this.cardNumber,
    required this.onPressed,
    required this.trailling,
    super.key,
    this.bgColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SubscriptionController());

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: borderColor ?? Colors.transparent),
        color: bgColor,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.lightblueshade2,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                Assets.images.png.visa.keyName,
                height: 11.h,
              ),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardName,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.nutralBlack1,
                  ),
                ),
                Text(
                  controller.obscureCardNumber(cardNumber),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.nutralBlack2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 35,
          ),
          trailling,
        ],
      ),
    );
  }
}
