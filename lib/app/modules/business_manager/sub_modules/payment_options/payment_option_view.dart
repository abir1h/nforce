import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/payment_options/check_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/payment_options/direct_debit_view.dart';
import 'package:nuforce/app/modules/business_manager/views/business_manager_settings_view.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../utils/colors.dart';
import '../../widgets/big_button_with_icon.dart';
import 'cash_view.dart';

class PaymentOptionView extends StatelessWidget {
  const PaymentOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.to(const BusinessManagerSettingsView());
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.white1,
        appBar: CustomAppbarMinimal(
            title: 'Payment Options',
            leadingPressed: () => Get.to(const BusinessManagerSettingsView())),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigButtonWithIcon(
                svgPath: Assets.images.svg.paymentOptions,
                lable: 'Cash',
                onTap: ()=>Get.to(const CashView())
              ),
              SizedBox(
                height: 16.h,
              ),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.check,
                lable: 'Check',
                  onTap: ()=>Get.to(const CheckView())

              ),
              SizedBox(
                height: 16.h,
              ),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.stripe,
                lable: 'Stripe',
                  onTap: (){}

              ),
              SizedBox(
                height: 16.h,
              ),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.document,
                lable: 'Direct Debit',
                  onTap: ()=>Get.to(const DirectDebitview())

              ),
            ],
          ),
        ),
      ),
    );
  }
}
