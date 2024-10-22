import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/custom_field/custom_field_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/payment_options/payment_option_view.dart';
import 'package:nuforce/app/modules/business_manager/views/business_manager_preferences_view.dart';
import 'package:nuforce/app/modules/business_manager/widgets/big_button_with_icon.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class BusinessManagerSettingsView extends StatelessWidget {
  const BusinessManagerSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: 'Settings',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        child: Column(
          children: [
            BigButtonWithIcon(
              svgPath: Assets.images.svg.preferences,
              lable: 'Preferences',
              onTap: () => Get.to<void>(const BusinessManagerPreferences()),
            ),
            const SizedBox(height: 16),
            BigButtonWithIcon(
              svgPath: Assets.images.svg.customFields,
              lable: 'Custom Fields',
              onTap: () => Get.to<void>(const CustomFieldView()),
            ),
            const SizedBox(height: 16),
            BigButtonWithIcon(
              svgPath: Assets.images.svg.paymentOptions,
              lable: 'Payment Options',
              onTap: () => Get.to<void>(const PaymentOptionView()),
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
    );
  }
}
