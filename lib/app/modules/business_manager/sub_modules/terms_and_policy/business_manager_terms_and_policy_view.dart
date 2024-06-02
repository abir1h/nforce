import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/terms_and_policy/business_manager_add_or_edit_terms_and_policy.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_terms_and_policy_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/terms_and_policy/business_manager_terms_and_policy_details_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/terms_and_policy/widget/business_manager_empty_terms_and_policy.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/terms_and_policy/widget/terms_and_policy_tile.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';

class BusinessManagerTermsAndConditionView extends StatefulWidget {
  const BusinessManagerTermsAndConditionView({super.key});

  @override
  State<BusinessManagerTermsAndConditionView> createState() => _BusinessManagerTermsAndPolicyViewState();
}

class _BusinessManagerTermsAndPolicyViewState extends State<BusinessManagerTermsAndConditionView> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessManagerTermsAndPolicyController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white1,
          appBar: CustomAppbarMinimal(
            title: 'Terms & Policy',
            trailing: [
              if (controller.termsList.isEmpty)
                const SizedBox()
              else
                GestureDetector(
                  onTap: () {
                    Get.to<void>(() => const BusinessManagerAddOrEditTermsAndPolicy());
                  },
                  child: Row(
                    children: [
                      Icon(Icons.add, color: AppColors.primaryBlue1, size: 16.sp),
                      const SizedBox(width: 8),
                      Text(
                        'Add New',
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
              child: controller.termsList.isEmpty
                  ? const EmptyTermsAndPolicy()
                  : Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: ListView.builder(
                        itemCount: controller.termsList.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: TermsAndPolicyTile(
                              termsAndPolicy: controller.termsList[index],
                              onTap: () {
                                Get.to<void>(
                                  () => BusinessManagerTermsAndPolicyDetailsView(
                                    termsAndPolicy: controller.termsList[index],
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
