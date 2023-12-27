import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nuforce/app/modules/settings/controllers/settings_controller.dart';
import 'package:nuforce/app/modules/settings/models/user_info.dart';

import '../../../../shared/widgets/custom_text_field.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../../shared/widgets/secondary_button.dart';
import 'account_information_view.dart';

class BusinessInfoEdit extends StatefulWidget {
  const BusinessInfoEdit({super.key});

  @override
  State<BusinessInfoEdit> createState() => _BusinessInfoEditState();
}

class _BusinessInfoEditState extends State<BusinessInfoEdit> {
  final controller = Get.put(SettingsController());
  String phone_number = '';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (_) {
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
                  hint: "Enter business name",
                  label: "Business Name",
                  onChange: (v) {},
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  controller: controller.businessDomain,
                  hint: "Enter business domain",
                  label: "Business Domain",
                  onChange: (v) {},
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  controller: controller.businessDomain,
                  hint: "Enter address",
                  label: "Address",
                  onChange: (v) {},
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  controller: controller.businessDomain,
                  hint: "Enter contact us",
                  label: "Contact us",
                  onChange: (v) {},
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  controller: controller.businessDomain,
                  hint: "Enter help email",
                  label: "Help email",
                  onChange: (v) {},
                ),
                SizedBox(
                  height: 100.h,
                ),
                Row(
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
                          var data = UserInfo(
                            firstName: controller.firstName.text,
                            lastName: controller.lastName.text,
                            email: controller.email.text,
                            mobile: phone_number,
                            address: controller.address.text,
                            businessDomain: controller.businessDomain.text,
                            businessName: controller.businessName.text,
                            contactUs: controller.contactUs.text,
                            helpEmail: controller.helpEmail.text,
                          );
                          controller.save(data);
                          Get.to(() => const AccountInformationView());
                        },
                        text: 'Update',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}