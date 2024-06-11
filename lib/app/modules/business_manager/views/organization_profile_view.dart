import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/organization_profile_controller.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/modules/business_manager/widgets/image_upload_optional.dart';

import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_phone_input.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class OrganizationProfileView extends StatefulWidget {
  const OrganizationProfileView({super.key});

  @override
  State<OrganizationProfileView> createState() => _OrganizationProfileViewState();
}

class _OrganizationProfileViewState extends State<OrganizationProfileView> {
  late final OrganizationProfileController orgProfileController;
  @override
  void initState() {
    super.initState();
    if (OrganizationProfileController().initialized) {
      orgProfileController = Get.find<OrganizationProfileController>();
    } else {
      orgProfileController = Get.put(OrganizationProfileController());
      orgProfileController.getProfileForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(title: 'Profile'),
      body: Builder(
        builder: (context) {
          return GetBuilder<OrganizationProfileController>(
            builder: (controller) {
              return CustomLoadingWidget(
                isLoading: controller.isLoading,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding, vertical: 15),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ImageUploadOptional(
                                image: controller.image,
                                onImageRemoveButtonTap: () {
                                  controller.removeImage();
                                },
                                ontap: () async {
                                  await controller.setImage();
                                },
                              ),
                              const SizedBox(height: 25),
                              CustomTextField(
                                label: 'Company Name',
                                hint: 'Write your company name here',
                                controller: controller.companyNameController,
                              ),
                              16.h.vSpace,
                              CustomTextField(
                                label: 'Organization Code',
                                hint: 'Enter your organization code',
                                controller: controller.orgCodeController,
                              ),
                              16.h.vSpace,
                              CustomDropdownButton<Option?>(
                                label: 'Industry Type',
                                hint: 'Select your industry type',
                                value: controller.selectedBusinessType,
                                items: controller.businessType
                                    .map(
                                      (e) => DropdownMenuItem<Option?>(
                                        value: e,
                                        child: Text(e.label ?? ''),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (v) {
                                  setState(() {
                                    controller.selectedBusinessType = v;
                                  });
                                },
                              ),
                              16.h.vSpace,
                              CustomPhoneInput(
                                label: 'Phone Number',
                                hint: 'Enter your phone number',
                                controller: controller.phoneController,
                              ),
                              16.h.vSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Country',
                                    style: CustomTextStyle.paragraphSmall.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.nutralBlack1,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.greyText,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: CountryCodePicker(
                                      onChanged: (v) {
                                        if (v.code != null) {
                                          controller.selectedCountry = v.code!;
                                        }
                                      },
                                      initialSelection: 'US',
                                      favorite: const ['US'],
                                      showCountryOnly: true,
                                      showOnlyCountryWhenClosed: true,
                                      alignLeft: true,
                                    ),
                                  ),
                                ],
                              ),
                              16.h.vSpace,
                              CustomTextField(
                                label: 'Website',
                                hint: 'Your website URL',
                                controller: controller.websiteController,
                              ),
                              const SizedBox(height: 32),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SecondaryButton(
                              onPressed: () {
                                if (controller.showResetWarning) {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        title: const Text('Warning'),
                                        content: Text(controller.resetWarning),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop();
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              // ctrl.resetForm(); // TODO reset form
                                              Navigator.of(ctx).pop();
                                            },
                                            child: const Text('Reset'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  // ctrl.resetForm(); // TODO reset form
                                }
                              },
                              text: 'Reset',
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: PrimaryButton(
                              onPressed: () {
                                if (controller.companyNameController.text.isEmpty || controller.orgCodeController.text.isEmpty || controller.selectedBusinessType == null) {
                                  Fluttertoast.showToast(msg: 'Please fill all fields');
                                  return;
                                }
                                if (controller.selectedCountry.isEmpty) {
                                  Fluttertoast.showToast(msg: 'Please select country');
                                  return;
                                }
                                if (controller.selectedBusinessType == null) {
                                  Fluttertoast.showToast(msg: 'Please select business type');
                                  return;
                                }
                                controller
                                    .submitForm(
                                  businessType: controller.selectedBusinessType?.value,
                                  countryCode: controller.selectedCountry,
                                  name: controller.companyNameController.text,
                                  logoUrl: '',
                                  orgCode: controller.orgCodeController.text,
                                )
                                    .then((value) {
                                  value.fold(
                                    (l) {
                                      Fluttertoast.showToast(msg: 'Profile updated successfully');
                                      Navigator.pop(context);
                                    },
                                    (r) {
                                      Fluttertoast.showToast(msg: 'Profile update failed');
                                    },
                                  );
                                });
                              },
                              text: 'Submit',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
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
