import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/organization_profile_controller.dart';
import 'package:nuforce/app/modules/business_manager/widgets/image_upload_optional.dart';

import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';

class OrganizationProfileView extends StatefulWidget {
  const OrganizationProfileView({super.key});

  @override
  State<OrganizationProfileView> createState() => _OrganizationProfileViewState();
}

class _OrganizationProfileViewState extends State<OrganizationProfileView> {
  @override
  void initState() {
    super.initState();
    Get.put(OrganizationProfileController()).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Profile'),
      body: Builder(
        builder: (context) {
          return GetBuilder<OrganizationProfileController>(
            builder: (ctrl) {
              return CustomLoadingWidget(
                isLoading: ctrl.isLoading,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 15),
                    child: Column(
                      children: [
                        ImageUploadOptional(
                          image: ctrl.image,
                          onImageRemoveButtonTap: () {
                            ctrl.removeImage();
                          },
                          ontap: () async {
                            await ctrl.setImage();
                          },
                        ),
                        const SizedBox(height: 25),
                        CustomTextField(
                          label: ctrl.displayNameLabel,
                          hint: 'Enter display name',
                          controller: ctrl.displayNameController,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          label: ctrl.brandTaglineLabel,
                          hint: 'Enter brand tagline',
                          controller: ctrl.brandTaglineController,
                        ),
                        const SizedBox(height: 16),
                        CustomDropdownButton(
                          label: ctrl.businessTypeLabel ?? 'Business Type',
                          hint: 'Select one',
                          onChanged: (p0) {
                            ctrl.onBusinessTypeChange(p0);
                          },
                          value: ctrl.selectedBusinessType,
                          items: ctrl.businessTypeList
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e.label ?? '',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.nutralBlack1,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          label: ctrl.profileAboutLabel,
                          controller: ctrl.aboutYourBusinessController,
                          hint: 'Write about your business',
                          maxLines: 3,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          label: ctrl.officeAddressLabel,
                          controller: ctrl.officeAddressController,
                          hint: 'Enter office address',
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          label: ctrl.phoneLabel,
                          controller: ctrl.phoneController,
                          hint: 'Enter phone number',
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          label: ctrl.emailLabel,
                          controller: ctrl.emailController,
                          hint: 'Enter email address',
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          label: ctrl.supportLabel,
                          controller: ctrl.supportController,
                          hint: 'Enter support email',
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          label: ctrl.websiteLabel,
                          controller: ctrl.websiteController,
                          hint: 'Enter website link',
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          label: ctrl.twitterHandleLabel,
                          controller: ctrl.twitterHandleController,
                          hint: 'Enter twitter handle',
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          label: ctrl.facebookPageLabel,
                          controller: ctrl.facebookPageController,
                          hint: 'Enter facebook page link',
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(
                              child: SecondaryButton(
                                onPressed: () {
                                  if (ctrl.showResetWarning) {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return AlertDialog(
                                          title: const Text('Warning'),
                                          content: Text(ctrl.resetWarning),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                ctrl.resetForm();
                                                Navigator.of(ctx).pop();
                                              },
                                              child: const Text('Reset'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    ctrl.resetForm();
                                  }
                                },
                                text: 'Reset',
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: PrimaryButton(
                                onPressed: () {
                                  // ctrl.submitForm();
                                },
                                text: 'Submit',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
