import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:nuforce/app/modules/settings/controllers/settings_controller.dart';
import 'package:nuforce/app/modules/settings/models/user_info.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';

class BusinessInfoEdit extends StatefulWidget {
  const BusinessInfoEdit({super.key});

  @override
  State<BusinessInfoEdit> createState() => _BusinessInfoEditState();
}

class _BusinessInfoEditState extends State<BusinessInfoEdit> {
  final controller = Get.put(SettingsController());
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          children: [
            Expanded(
              child: SecondaryButton(
                onPressed: () {},
                text: 'Reset',
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: PrimaryButton(
                onPressed: () {
                  final data = UserInfo(
                    firstName: controller.firstName.text,
                    lastName: controller.lastName.text,
                    email: controller.email.text,
                    mobile: phoneNumber,
                    address: controller.address.text,
                    businessDomain: controller.businessDomain.text,
                    businessName: controller.businessName.text,
                    contactUs: controller.contactUs.text,
                    helpEmail: controller.helpEmail.text,
                  );
                  controller.save(data);
                  Get.back();
                },
                text: 'Update',
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: GetBuilder<SettingsController>(
        builder: (_) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 37.h, horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: controller.businessName,
                      hint: 'Enter business name',
                      label: 'Business Name',
                      onChanged: (v) {},
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextField(
                      controller: controller.businessDomain,
                      hint: 'Enter business domain',
                      label: 'Business Domain',
                      onChanged: (v) {},
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextField(
                      controller: controller.businessDomain,
                      hint: 'Enter address',
                      label: 'Address',
                      onChanged: (v) {},
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextField(
                      controller: controller.businessDomain,
                      hint: 'Enter contact us',
                      label: 'Contact us',
                      onChanged: (v) {},
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextField(
                      controller: controller.businessDomain,
                      hint: 'Enter help email',
                      label: 'Help email',
                      onChanged: (v) {},
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
