import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/commission_data_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/business_manager_add_or_edit_commission_tier.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/business_manager_commission_tiers_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';
import 'package:nuforce/main.dart';

class BusinessManagerCommissionTierDeatilsView extends StatelessWidget {
  const BusinessManagerCommissionTierDeatilsView({
    required this.commissionTier,
    super.key,
  });
  final Commission? commissionTier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Details'),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
          child: GetBuilder<BusinessManagerCommissionTiersController>(
            builder: (controller) {
              return CustomLoadingWidget(
                isLoading: controller.isLoading,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'Name', subtitle: commissionTier?.name ?? 'N/A'),
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'Rate', subtitle: commissionTier?.detailsDefaultValue ?? 'N/A'),
                    const SizedBox(height: 16),
                    TitleSubtitleMinimal(title: 'First Rate', subtitle: commissionTier?.detailsInitialValue ?? 'N/A'),
                    // const SizedBox(height: 16),
                    // TitleSubtitleMinimal(title: 'Source', subtitle: commissionTier.source ?? 'N/A'),
                    // const SizedBox(height: 16),
                    // TitleSubtitleMinimal(title: 'Reward on', subtitle: commissionTier.rewardOn ?? 'N/A'),
                    // const SizedBox(height: 16),
                    // TitleSubtitleMinimal(title: 'Description', subtitle: commissionTier.description ?? 'N/A'),
                    // const SizedBox(height: 32),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButton(
                            onPressed: () {
                              // Get.back<void>();
                              // controller.commissionTierController.removeCommissionTier(commissionTier);
                              // Fluttertoast.showToast(msg: 'Commission Tier Deleted');
                              final controller = Get.find<BusinessManagerCommissionTiersController>();
                              controller.saveEditOrDelete(action: ActionType.delete, id: commissionTier?.id).then(
                                (value) {
                                  if (value) {
                                    Get.back<void>();
                                    Fluttertoast.showToast(msg: 'Commission Tier Deleted');
                                  }
                                },
                              );
                            },
                            text: 'Delete',
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () async {
                              final controller = Get.find<BusinessManagerCommissionTiersController>();
                              await controller.getCommissionForm(commissionTier?.id);
                              Get
                                ..back<void>()
                                ..to<void>(() => BusinessManagerAddOrEditCommissionTier(commissionTier: commissionTier));
                            },
                            text: 'Edit',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
