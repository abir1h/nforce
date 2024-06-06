import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/auth/components/account_creation_complete_sheet.dart';
import 'package:nuforce/app/modules/auth/components/company_image.dart';
import 'package:nuforce/app/modules/auth/controllers/account_setup_controller.dart';
import 'package:nuforce/app/modules/business_manager/models/form_model.dart';
import 'package:nuforce/app/routes/app_pages.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_phone_input.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/custom_loading_widget.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/main.dart';

class AccountSetupView extends StatefulWidget {
  const AccountSetupView({super.key});

  @override
  State<AccountSetupView> createState() => _AccountSetupViewState();
}

class _AccountSetupViewState extends State<AccountSetupView> {
  @override
  void initState() {
    super.initState();
    Get.put(AccountSetupController()).setForm();
  }

  final companyNameController = TextEditingController();
  final phoneController = TextEditingController();
  final websiteController = TextEditingController();
  final orgCodeController = TextEditingController();

  String selectedCountry = 'US';

  List<Option> businessType = [
    Option(label: 'Self Employed', value: ''),
    Option(label: 'Team Work', value: 'team'),
    Option(label: 'Corporation', value: 'corporation'),
    Option(label: 'Proprietorship', value: 'proprietorship'),
    Option(label: 'Partnership', value: 'partnership'),
  ];
  Option? selectedBusinessType;

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
          child: GetBuilder<AccountSetupController>(builder: (controller) {
            return CustomLoadingWidget(
              isLoading: controller.isLoading,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
                child: Column(
                  children: [
                    Text(
                      'Setup your account',
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.heading1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                    24.h.vSpace,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CompanyImage(),
                            16.h.vSpace,
                            CustomTextField(
                              label: 'Company Name',
                              hint: 'Write your company name here',
                              controller: companyNameController,
                            ),
                            16.h.vSpace,
                            CustomTextField(
                              label: 'Organization Code',
                              hint: 'Enter your organization code',
                              controller: orgCodeController,
                            ),
                            16.h.vSpace,
                            CustomDropdownButton<Option?>(
                              label: 'Industry Type',
                              hint: 'Select your industry type',
                              value: selectedBusinessType,
                              items: businessType
                                  .map(
                                    (e) => DropdownMenuItem<Option?>(
                                      value: e,
                                      child: Text(e.label ?? ''),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (v) {
                                setState(() {
                                  selectedBusinessType = v;
                                });
                              },
                            ),
                            16.h.vSpace,
                            CustomPhoneInput(
                              label: 'Phone Number',
                              hint: 'Enter your phone number',
                              controller: phoneController,
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
                                        selectedCountry = v.code!;
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
                              controller: websiteController,
                            ),
                            16.h.vSpace,
                            PrimaryButton(
                              onPressed: () async {
                                controller
                                    .saveBusinessProfile(
                                  countryCode: selectedCountry,
                                  name: companyNameController.text,
                                  businessType: selectedBusinessType?.value,
                                  orgCode: orgCodeController.text,
                                  logoUrl: '',
                                )
                                    .then((value) {
                                  if (value) {
                                    accountCreationComplete(context).then((value) {
                                      Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
                                    });
                                  } else {
                                    // Fluttertoast.showToast(msg: 'Something went wrong. Please try again.');
                                  }
                                });
                              },
                              text: 'Continue',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
