import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nuforce/app/modules/settings/sub_modules/contact_center/controller/contact_center_controller.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';

class AddContactCenterView extends StatefulWidget {
  const AddContactCenterView({super.key});

  @override
  State<AddContactCenterView> createState() => _AddContactCenterViewState();
}

class _AddContactCenterViewState extends State<AddContactCenterView> {
  final controller = Get.put(ContactCenterController());
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const CustomAppbarMinimal(
        title: 'Add New Contact Center',

      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          children: [
            Expanded(
              child: SecondaryButton(
                onPressed: controller.removeContactCenter,
                text: 'Reset',
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: PrimaryButton(
                onPressed: controller.addContactCenter,
                text: 'Save',
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: GetBuilder<ContactCenterController>(
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
                      controller: controller.titleController,
                      hint: 'Enter title',
                      label: 'Title',
                      onChange: (v) {},
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextField(
                      controller: controller.officeNameController,
                      hint: 'Enter name',
                      label: 'Office Name',
                      onChange: (v) {},
                    ),
                    SizedBox(
                      height: 16.h,
                    ),  Text(
                      'Phone Number ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.nutralBlack1,
                      ),
                    ),  SizedBox(
                      height: 16.h,
                    ),Container(
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
                              vertical: 16,
                            ),
                            border: InputBorder.none,
                            hintText: 'Enter number',
                            hintStyle: CustomTextStyle.paragraphSmall.copyWith(fontWeight: FontWeight.w400, color: AppColors.white3, fontFamily: 'Poppins'),
                          ),
                          onInputChanged: (PhoneNumber number) {
                            phoneNumber = number.phoneNumber!;
                          },
                          onInputValidated: (bool value) {},
                          selectorConfig: const SelectorConfig(
                            trailingSpace: false,
                          ),
                          ignoreBlank: true,
                          selectorTextStyle: const TextStyle(color: AppColors.subText),
                          textFieldController: controller.phoneController,
                          keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                          inputBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.greyText),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          onSaved: print,
                        ),
                      ),
                    ), SizedBox(
                      height: 16.h,
                    ),
                    CustomTextField(
                      controller: controller.emailController,
                      hint: 'Enter email',
                      label: 'Email',
                      onChange: (v) {},
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextField(
                      controller: controller.addressController,
                      hint: 'Enter address',
                      label: 'Office address',
                      onChange: (v) {},
                    ),
                    SizedBox(
                      height: 8.h,
                    ), CustomTextField(
                      controller: controller.descriptionController,
                      hint: 'Write details',
                      label: 'Description',maxLines: 4,
                      onChange: (v) {},
                    ),SizedBox(height: 400.h,),

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
