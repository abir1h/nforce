import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/business_manager_add_or_edit_commission_tier.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/business_manager_commission_tiers_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/business_manager_commission_tiers_details_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/widget/business_manager_empty_commission_tier.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/widget/commission_tier_tile.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';

class BusinessManagerCommissionTiersView extends StatefulWidget {
  const BusinessManagerCommissionTiersView({super.key});

  @override
  State<BusinessManagerCommissionTiersView> createState() => _BusinessManagerCommissionTiersViewState();
}

class _BusinessManagerCommissionTiersViewState extends State<BusinessManagerCommissionTiersView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessManagerCommissionTiersController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white1,
          appBar: CustomAppbarMinimal(
            title: 'Commission Tiers',
            trailing: [
              if (controller.commissionTier?.commission?.isEmpty ?? true)
                const SizedBox()
              else
                Align(
                  child: GestureDetector(
                    onTap: () async {
                      await controller.getCommissionForm();
                      Get.to<void>(() => const BusinessManagerAddOrEditCommissionTier());
                    },
                    child: Text(
                      '+ Add',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppColors.primaryBlue1,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              const SizedBox(width: 16),
            ],
          ),
          body: SizedBox(
            width: Get.width,
            child: CustomLoadingWidget(
              isLoading: controller.isLoading,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                child: controller.commissionTier?.commission?.isEmpty ?? true
                    ? const EmptyCommissionTier()
                    : Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: ListView.builder(
                          itemCount: controller.commissionTier?.commission?.length ?? 0,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final commission = controller.commissionTier!.commission![index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: CommissionTierTile(
                                commission: commission,
                                onTap: () {
                                  Get.to<void>(
                                    () => BusinessManagerCommissionTierDeatilsView(
                                      commissionTier: commission,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
