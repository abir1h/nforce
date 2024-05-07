import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/shared/widgets/colored_button.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

class MiniInvoiceTile extends StatelessWidget {
  const MiniInvoiceTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.white1,
        boxShadow: [
          BoxShadow(
            color: AppColors.white2,
            blurRadius: 10.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'AT35- 2308105',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '\$500.00',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          4.h.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '27 Aug, 2023',
                style: TextStyle(
                  color: AppColors.nutralBlack2,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              ColoredButton(
                onTap: () {},
                height: 22,
                text: "Pending",
                textColor: AppColors.yellow,
              ),
            ],
          ),
          12.h.vSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PrimaryButton(
                  height: 30,
                  onPressed: () {},
                  text: "View Invoice",
                ),
              ),
              8.w.hSpace,
              Expanded(
                child: SecondaryButton(
                  height: 30,
                  onPressed: () {},
                  text: 'Customer Preview',
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
