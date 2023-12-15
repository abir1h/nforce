import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/business_manager_add_or_edit_commission_tier.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/business_manager_commission_tiers_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/main.dart';

class BusinessManagerCommissionTierDeatilsView extends StatelessWidget {
  const BusinessManagerCommissionTierDeatilsView({
    super.key,
    required this.commissionTier,
  });
  final MockCommissionTier commissionTier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Details'),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Name', subtitle: commissionTier.tierName),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Rate', subtitle: commissionTier.rate.toString()),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'First Rate', subtitle: commissionTier.firstRate.toString()),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Source', subtitle: commissionTier.source ?? 'N/A'),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Reward on', subtitle: commissionTier.rewardOn ?? 'N/A'),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Description', subtitle: commissionTier.description ?? 'N/A'),
              const SizedBox(height: 32),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        Get.back();
                        final controller = Get.find<BusinessManagerController>();
                        controller.commissionTierController.removeCommissionTier(commissionTier);
                        Fluttertoast.showToast(msg: 'Commission Tier Deleted');
                      },
                      text: 'Delete',
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        Get.back();
                        Get.to(() => BusinessManagerAddOrEditCommissionTier(commissionTier: commissionTier));
                      },
                      text: 'Edit',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
