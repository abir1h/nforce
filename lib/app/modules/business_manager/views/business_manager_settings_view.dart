import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/payment_options/payment_option_view.dart';
import 'package:nuforce/app/modules/business_manager/widgets/big_button_with_icon.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

import 'business_manager_preferences_view.dart';
import 'business_manager_view.dart';

class BusinessManagerSettingsView extends StatelessWidget {
  const BusinessManagerSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.to(const BusinessManagerView());

        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.white1,
        appBar: CustomAppbarMinimal(
          title: 'Settings',
          leadingPressed: () => Get.to(const BusinessManagerView()),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
          child: Column(
            children: [
              BigButtonWithIcon(
                svgPath: Assets.images.svg.preferences,
                lable: 'Preferences',
                onTap: () => Get.to(const BusinessManagerPreferences()),
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.customFields,
                lable: 'Custom Fields',
                onTap: () {},
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.paymentOptions,
                lable: 'Payment Options',
                onTap: () => Get.to(const PaymentOptionView()),
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.stripe,
                lable: 'Stripe',
                onTap: () {},
              ),
              const SizedBox(height: 16),
              BigButtonWithIcon(
                svgPath: Assets.images.svg.activityLogs,
                lable: 'Activity Logs',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
