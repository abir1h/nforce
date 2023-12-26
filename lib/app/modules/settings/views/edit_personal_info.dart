import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nuforce/app/modules/settings/controllers/settings_controller.dart';
import 'package:nuforce/app/modules/settings/models/user_info.dart';
import 'package:nuforce/app/modules/settings/views/account_information_view.dart';

import '../../../shared/widgets/primary_button.dart';
import '../../../shared/widgets/secondary_button.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class PersonalInfoEdit extends StatefulWidget {
  const PersonalInfoEdit({super.key});

  @override
  State<PersonalInfoEdit> createState() => _PersonalInfoEditState();
}

class _PersonalInfoEditState extends State<PersonalInfoEdit> {
  final controller = Get.put(SettingsController());
  String phone_number='';

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
                Text(
                  "First Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 14.sp, color: AppColors.nutralBlack1),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  // height: 50,
                  color: AppColors.textFieldBackground,
                  child: TextFormField(
                    controller: controller.firstName,
                    cursorColor: AppColors.primaryBlue1,
                    autocorrect: false,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      hintText: "First Name",
                      hintStyle: CustomTextStyle.paragraphSmall.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.greyText,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.greyText,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.primaryBlue1,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onChanged: (v) {
                     /* controller.setExpiration(v);*/
                    },
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Last Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 14.sp, color: AppColors.nutralBlack1),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  // height: 50,
                  color: AppColors.textFieldBackground,
                  child: TextFormField(
                    controller: controller.lastName,
                    cursorColor: AppColors.primaryBlue1,
                    autocorrect: false,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      hintText: "Last Name",
                      hintStyle: CustomTextStyle.paragraphSmall.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.greyText,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.greyText,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.primaryBlue1,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onChanged: (v) {
                     /* controller.setExpiration(v);*/
                    },
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ), Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 14.sp, color: AppColors.nutralBlack1),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  // height: 50,
                  color: AppColors.textFieldBackground,
                  child: TextFormField(
                    controller: controller.email,
                    cursorColor: AppColors.primaryBlue1,
                    autocorrect: false,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      hintText: "Enter Email",
                      hintStyle: CustomTextStyle.paragraphSmall.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.greyText,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.greyText,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.primaryBlue1,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onChanged: (v) {
                     /* controller.setExpiration(v);*/
                    },
                  ),
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
                        phone_number=number.phoneNumber!;
                      },
                      onInputValidated: (bool value) {},
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                        trailingSpace: false,
                      ),
                      ignoreBlank: true,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(color: AppColors.subText),
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
                ),SizedBox(height: 185.h,),

                Row(
                  children: [
                    Expanded(
                      child: SecondaryButton(
                        onPressed: () {

                        },
                        text: 'Reset',
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: PrimaryButton(
                        onPressed: () {
                          var data=UserInfo(
                            firstName: controller.firstName.text,
                            lastName: controller.lastName.text,
                            email: controller.email.text,
                            mobile: phone_number
                          );
                          controller.save(data);
                          Get.to(()=>const AccountInformationView());

                        },
                        text:  'Update',
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
