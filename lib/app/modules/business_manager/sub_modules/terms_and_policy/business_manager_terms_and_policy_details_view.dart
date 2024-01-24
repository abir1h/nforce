import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/business_manager_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/terms_and_policy/business_manager_add_or_edit_terms_and_policy.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/terms_and_policy/business_manager_terms_and_policy_controller.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/main.dart';

class BusinessManagerTermsAndPolicyDetailsView extends StatelessWidget {
  const BusinessManagerTermsAndPolicyDetailsView({
    required this.termsAndPolicy,
    super.key,
  });
  final MockTermsAndPolicy termsAndPolicy;

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
              TitleSubtitleMinimal(title: 'Policy Name', subtitle: termsAndPolicy.policyName),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Policy Type', subtitle: termsAndPolicy.policyType),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Brief Description', subtitle: termsAndPolicy.briefDescription),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Instructions', subtitle: termsAndPolicy.instructions),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Policy', subtitle: termsAndPolicy.policy),
              const SizedBox(height: 32),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        Get.back<void>();
                        final controller = Get.find<BusinessManagerController>();
                        controller.termsAndPolicyController.removeTermsAndPolicy(termsAndPolicy);
                        Fluttertoast.showToast(msg: 'Terms and policy deleted');
                      },
                      text: 'Delete',
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        Get
                          ..back<void>()
                          ..to<void>(() => BusinessManagerAddOrEditTermsAndPolicy(termsAndPolicy: termsAndPolicy));
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
