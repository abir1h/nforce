import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class BusinessManagerTermsAndPolicyDetailsView extends StatefulWidget {
  const BusinessManagerTermsAndPolicyDetailsView({
    required this.termsAndPolicy,
    super.key,
  });
  final MockTermsAndPolicy termsAndPolicy;

  @override
  State<BusinessManagerTermsAndPolicyDetailsView> createState() => _BusinessManagerTermsAndPolicyDetailsViewState();
}

class _BusinessManagerTermsAndPolicyDetailsViewState extends State<BusinessManagerTermsAndPolicyDetailsView> {
  final QuillController _controller = QuillController.basic();
  @override
  void initState() {
    super.initState();
    _controller.document = Document.fromJson(jsonDecode(widget.termsAndPolicy.policy) as List<dynamic>);
  }

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
              TitleSubtitleMinimal(title: 'Policy Name', subtitle: widget.termsAndPolicy.policyName),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Policy Type', subtitle: widget.termsAndPolicy.policyType),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Brief Description', subtitle: widget.termsAndPolicy.briefDescription),
              const SizedBox(height: 16),
              TitleSubtitleMinimal(title: 'Instructions', subtitle: widget.termsAndPolicy.instructions),
              const SizedBox(height: 16),
              Text(
                'Policy',
                style: TextStyle(
                  color: AppColors.subText,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  controller: _controller,
                  // readOnly: true,
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('en'),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        Get.back<void>();
                        final controller = Get.find<BusinessManagerController>();
                        controller.termsAndPolicyController.removeTermsAndPolicy(widget.termsAndPolicy);
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
                          ..to<void>(() => BusinessManagerAddOrEditTermsAndPolicy(termsAndPolicy: widget.termsAndPolicy));
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
