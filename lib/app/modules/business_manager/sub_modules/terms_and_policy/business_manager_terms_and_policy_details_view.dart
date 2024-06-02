import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/service_terms_edit_controller.dart';
import 'package:nuforce/app/modules/business_manager/models/service_terms_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/calendar/services/business_manager_calendar_api_services.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/terms_and_policy/business_manager_add_or_edit_terms_and_policy.dart';
import 'package:nuforce/app/modules/service_items/widgets/title_subtitle_minimal_widget.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dialog.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';
import 'package:nuforce/main.dart';

class BusinessManagerTermsAndPolicyDetailsView extends StatefulWidget {
  const BusinessManagerTermsAndPolicyDetailsView({
    required this.termsAndPolicy,
    super.key,
  });
  final ServiceTermsModel termsAndPolicy;

  @override
  State<BusinessManagerTermsAndPolicyDetailsView> createState() => _BusinessManagerTermsAndPolicyDetailsViewState();
}

class _BusinessManagerTermsAndPolicyDetailsViewState extends State<BusinessManagerTermsAndPolicyDetailsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Details'),
      body: SizedBox(
        height: height,
        width: width,
        child: GetBuilder<ServiceTermsEditController>(builder: (controller) {
          return CustomLoadingWidget(
            isLoading: controller.isLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  TitleSubtitleMinimal(title: 'Policy Name', subtitle: widget.termsAndPolicy.name),
                  const SizedBox(height: 16),
                  TitleSubtitleMinimal(title: 'Policy Type', subtitle: widget.termsAndPolicy.policyType),
                  /*  const SizedBox(height: 16),
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
                    */
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryButton(
                          onPressed: () {
                            /*  Get.back<void>();
                              final controller = Get.find<BusinessManagerController>();
                              controller.termsAndPolicyController.removeTermsAndPolicy(widget.termsAndPolicy);
                              Fluttertoast.showToast(msg: 'Terms and policy deleted');*/
                            // ServiceTermsEditController
                            showDialog(
                              context: context,
                              builder: (ctx) {
                                return CustomDialog(
                                  dialogType: DialogType.warning,
                                  title: 'Delete Terms and policy?',
                                  content: 'Are you sure you want to delete ${widget.termsAndPolicy.name}?',
                                  primaryText: 'Delete',
                                  onPrimaryButtonPress: () async {
                                    Navigator.of(ctx).pop();
                                    await controller
                                        .addEditDeleteTerms(
                                      action: ActionType.delete,
                                      id: widget.termsAndPolicy.id,
                                    )
                                        .then((value) {
                                      if (value == true) {
                                        Get.back();
                                      }
                                    });

                                    // final controller = Get.find<BusinessManagerLabelController>();
                                    // controller.saveEditOrDelete(action: ActionType.delete, id: label.id).then((value) {
                                    //   if (value) {
                                    //     Get.back<void>();
                                    //   }
                                    // });
                                  },
                                  secondaryText: 'Cancel',
                                  onSecondaryButtonPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                );
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
                            final controller = Get.find<ServiceTermsEditController>();
                            await controller.setTermsForm(widget.termsAndPolicy.id);
                            Get
                              ..back<void>()
                              ..to<void>(() => BusinessManagerAddOrEditTermsAndPolicy(termsAndPolicy: widget.termsAndPolicy));
                          },
                          text: 'Edit',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
