import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/assets.gen.dart';
import '../../../utils/colors.dart';

class VisaCard extends StatelessWidget {
  final String cardName;
  final String cardNumber;
  final Widget trailling;
  final VoidCallback onPressed;
  final Color? bgColor;

  VisaCard({
    required this.cardName,
    required this.cardNumber,
    required this.onPressed, required this.trailling, this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: bgColor,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.lightblueshade,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    fontFamily: "Poppins",
                    color: AppColors.nutralBlack1,
                  ),
                ),
                Text(
                  cardNumber,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    fontFamily: "Poppins",
                    color: AppColors.nutralBlack2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 35,
          ),
          trailling
        ],
      ),
    );
  }
}
