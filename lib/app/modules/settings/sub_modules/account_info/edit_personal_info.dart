import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../controllers/settings_controller.dart';
import '../../models/user_info.dart';

import '../../../../shared/widgets/custom_text_field.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../../shared/widgets/secondary_button.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/text_styles.dart';
import 'account_information_view.dart';

class PersonalInfoEdit extends StatefulWidget {
  const PersonalInfoEdit({super.key});

  @override
  State<PersonalInfoEdit> createState() => _PersonalInfoEditState();
}

class _PersonalInfoEditState extends State<PersonalInfoEdit> {
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
                  controller: controller.firstName,
                  hint: "First Name",
                  label: "First Name",
                  onChange: (v) {},
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  controller: controller.lastName,
                  hint: "Last Name",
                  label: "Last Name",
                  onChange: (v) {},
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  controller: controller.email,
                  hint: "Email",
                  label: "Email",
                  onChange: (v) {},
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Phone Number ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.nutralBlack1,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppColors.white4,
                    ),
                    color: AppColors.textFieldBackground,
                  ),
                  child: Center(
                    child: InternationalPhoneNumberInput(
                      cursorColor: AppColors.primaryBlue1,
                      inputDecoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 16,
                        ),
                        border: InputBorder.none,
                        hintText: 'Enter number',
                        hintStyle: CustomTextStyle.paragraphSmall.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.white3,
                            fontFamily: "Poppins"),
                      ),
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                        phone_number = number.phoneNumber!;
                      },
                      onInputValidated: (bool value) {},
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                        trailingSpace: false,
                      ),
                      ignoreBlank: true,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle:
                          const TextStyle(color: AppColors.subText),
                      textFieldController: controller.phoneNumber,
                      formatInput: true,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      inputBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.greyText),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      onSaved: (PhoneNumber number) {
                        print(number);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 185.h,
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
                              mobile: phone_number);
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
