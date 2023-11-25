import 'package:flutter/material.dart';
import 'package:nuforce/app/modules/business_manager/widgets/big_button_with_icon.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.horizontalPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BigButtonWithIcon(
                svgPath: Assets.images.svg.preferences,
                lable: 'Preferences',
                onTap: () {},
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
                onTap: () {},
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
