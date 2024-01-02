import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/business_manager_add_or_edit_commission_tier.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/business_manager_commission_tiers_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/business_manager_commission_tiers_details_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/widget/business_manager_empty_commission_tier.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/commision_tires/widget/commission_tier_tile.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

class BusinessManagerCommissionTiersView extends StatefulWidget {
  const BusinessManagerCommissionTiersView({super.key});

  @override
  State<BusinessManagerCommissionTiersView> createState() => _BusinessManagerCommissionTiersViewState();
}

class _BusinessManagerCommissionTiersViewState extends State<BusinessManagerCommissionTiersView> {
  final controller = Get.find<BusinessManagerController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessManagerCommissionTiersController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.white1,
          appBar: CustomAppbarMinimal(
            title: 'Commission Tiers',
            trailing: [
              if (controller.commissionTierController.mockCommissionTier.isEmpty)
                const SizedBox()
              else
                GestureDetector(
                  onTap: () {
                    Get.to<void>(() => const BusinessManagerAddOrEditCommissionTier());
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add, color: AppColors.primaryBlue1, size: 16.sp),
                      const SizedBox(width: 4),
                      Text(
                        'Add',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: AppColors.primaryBlue1,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(width: 16),
            ],
          ),
          body: SizedBox(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: controller.commissionTierController.mockCommissionTier.isEmpty
                  ? const EmptyCommissionTier()
                  : Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: ListView.builder(
                        itemCount: controller.commissionTierController.mockCommissionTier.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: CommissionTierTile(
                              commission: controller.commissionTierController.mockCommissionTier[index],
                              onTap: () {
                                Get.to<void>(
                                  () => BusinessManagerCommissionTierDeatilsView(
                                    commissionTier: controller.commissionTierController.mockCommissionTier[index],
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
        );
      },
    );
  }
}
