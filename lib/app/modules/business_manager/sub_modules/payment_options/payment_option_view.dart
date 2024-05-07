import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:nuforce/app/modules/business_manager/sub_modules/payment_options/cash_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/payment_options/check_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/payment_options/direct_debit_view.dart';
import 'package:nuforce/app/modules/business_manager/widgets/big_button_with_icon.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class PaymentOptionView extends StatelessWidget {
  const PaymentOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: 'Payment Options',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigButtonWithIcon(svgPath: Assets.images.svg.paymentOptions, lable: 'Cash', onTap: () => Get.to<void>(const CashView())),
            SizedBox(
              height: 16.h,
            ),
            BigButtonWithIcon(svgPath: Assets.images.svg.check, lable: 'Check', onTap: () => Get.to<void>(const CheckView())),
            SizedBox(
              height: 16.h,
            ),
            BigButtonWithIcon(svgPath: Assets.images.svg.stripe, lable: 'Stripe', onTap: () {}),
            SizedBox(
              height: 16.h,
            ),
            BigButtonWithIcon(svgPath: Assets.images.svg.document, lable: 'Direct Debit', onTap: () => Get.to<void>(const DirectDebitview())),
          ],
        ),
      ),
    );
  }
}
