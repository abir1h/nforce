import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:nuforce/app/modules/business_manager/sub_modules/regional_setting/widget/custom_text_block.dart';
import 'package:nuforce/app/modules/settings/controllers/settings_controller.dart';
import 'package:nuforce/app/modules/settings/sub_modules/account_info/account_info_edit_view.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';

class AccountInformationView extends StatefulWidget {
  const AccountInformationView({super.key});

  @override
  State<AccountInformationView> createState() => _AccountInformationViewState();
}

class _AccountInformationViewState extends State<AccountInformationView> {
  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: const CustomAppbarMinimal(
        title: 'Account information',
      ),
      body: GetBuilder<SettingsController>(
        builder: (_) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Information',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextBlock(
                      label: 'First Name',
                      value: controller.userInfo != null ? controller.userInfo!.firstName! : 'First Name',
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextBlock(
                      label: 'Last Name',
                      value: controller.userInfo != null ? controller.userInfo!.lastName! : 'Last Name',
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextBlock(
                      label: 'Email',
                      value: controller.userInfo != null ? controller.userInfo!.email! : 'Email',
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextBlock(
                      label: 'Mobile',
                      value: controller.userInfo != null ? controller.userInfo!.mobile! : 'Mobile',
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'Business Information',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextBlock(
                      label: 'Business Name',
                      value: controller.userInfo != null
                          ? controller.userInfo!.businessName != null
                              ? controller.userInfo!.businessName!
                              : 'Business Name'
                          : 'Business Name',
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextBlock(
                      label: 'Business Domain',
                      value: controller.userInfo != null
                          ? controller.userInfo?.businessDomain != null
                              ? controller.userInfo?.businessDomain ?? ''
                              : 'Business Domain'
                          : 'Business Domain',
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextBlock(
                      label: 'Address',
                      value: controller.userInfo != null
                          ? controller.userInfo!.address != null
                              ? controller.userInfo!.address!
                              : 'Address'
                          : 'Address',
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextBlock(
                      label: 'Contact us',
                      value: controller.userInfo != null
                          ? controller.userInfo!.contactUs != null
                              ? controller.userInfo!.contactUs!
                              : 'Contact us'
                          : 'Contact us',
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextBlock(
                      label: 'Help Email',
                      value: controller.userInfo != null
                          ? controller.userInfo!.helpEmail != null
                              ? controller.userInfo!.helpEmail!
                              : 'Help Email'
                          : 'Help Email',
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                PrimaryButton(
                  onPressed: () {
                    Get.to<void>(() => const AccountInfoEditView());
                  },
                  text: 'Edit',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
