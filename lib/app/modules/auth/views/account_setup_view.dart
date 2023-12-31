import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/components/account_creation_complete_sheet.dart';
import 'package:nuforce/app/modules/auth/components/company_image.dart';
import 'package:nuforce/app/modules/auth/views/otp_view.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_phone_input.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/main.dart';

import '../controllers/auth_controller.dart';

class AccountSetupView extends GetView<AuthController> {
  const AccountSetupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: '',
      ),
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Setup your account',
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.heading1.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.nutralBlack1,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const CompanyImage(),
                  const SizedBox(height: 16),
                  const CustomTextField(
                    label: 'Company Name',
                    hint: 'Write company name',
                    controller: null,
                  ),

                  const SizedBox(height: 16),
                  Obx(
                    () => CustomDropdownButton(
                      items: controller.signUpController.industryType
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.subText,
                                  ),
                                ),
                              ))
                          .toList(),
                      hint: controller.signUpController.selectedIndustry.value,
                      onChanged: (v) {
                        controller.signUpController.selectedIndustry.value = v;
                      },
                      label: 'Industry Type',
                      value: null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const CustomPhoneInput(
                    label: 'Phone Number',
                    hint: 'Enter phone number',
                    controller: null,
                  ),

                  const SizedBox(height: 16),
                  const CustomTextField(
                    label: 'Website',
                    hint: 'Website Link',
                    controller: null,
                  ),

                  const SizedBox(height: 16),
                  Obx(
                    () => CustomDropdownButton(
                      items: controller.signUpController.country
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.subText,
                                  ),
                                ),
                              ))
                          .toList(),
                      hint: controller.signUpController.selectedCountry.value,
                      onChanged: (v) {
                        controller.signUpController.selectedCountry.value = v;
                      },
                      label: 'Country',
                      value: null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => CustomDropdownButton(
                      items: controller.signUpController.state
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.subText,
                                  ),
                                ),
                              ))
                          .toList(),
                      hint: controller.signUpController.selectedState.value,
                      onChanged: (v) {
                        controller.signUpController.selectedState.value = v;
                      },
                      label: 'State',
                      value: null,
                    ),
                  ),

                  //d
                  const SizedBox(height: 30),
                  PrimaryButton(
                    onPressed: () {
                      controller.changeFromSetupAccount(true);
                      Get.to(() => const OtpView())!.then((value) {
                        accountCreationComplete(context);
                      });
                    },
                    text: 'Continue',
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
