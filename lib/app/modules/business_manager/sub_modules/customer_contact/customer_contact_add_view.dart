import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/customer_contact_controller.dart';
import 'package:nuforce/app/modules/business_manager/models/customer_contact_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/customer_contact_list_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/regional_setting/widget/custom_button.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class CustomerContactAddView extends StatefulWidget {
  const CustomerContactAddView({super.key});

  @override
  State<CustomerContactAddView> createState() => _CustomerContactAddViewState();
}

class _CustomerContactAddViewState extends State<CustomerContactAddView> {
  final controller = Get.put(CustomerContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: CustomAppbarMinimal(
        title: 'Add Customer Contacts',
        leadingPressed: () {
          Get.to<void>(const CustomerContactListView());
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                color: AppColors.nutralBlack1,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            ColoredBox(
              // height: 50,
              color: AppColors.textFieldBackground,
              child: TextFormField(
                controller: controller.name,
                cursorColor: AppColors.primaryBlue1,
                autocorrect: false,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  hintText: 'Enter display name',
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
                onChanged: (v) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Text(
                'Contact Name',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  fontFamily: 'Poppins',
                  color: AppColors.greyText,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Ref Code',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                color: AppColors.nutralBlack1,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            ColoredBox(
              // height: 50,
              color: AppColors.textFieldBackground,
              child: TextFormField(
                controller: controller.refCode,
                cursorColor: AppColors.primaryBlue1,
                autocorrect: false,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  hintText: 'Enter ref code',
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
                onChanged: (v) {},
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Company',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                color: AppColors.nutralBlack1,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            ColoredBox(
              // height: 50,
              color: AppColors.textFieldBackground,
              child: TextFormField(
                controller: controller.company,
                cursorColor: AppColors.primaryBlue1,
                autocorrect: false,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  hintText: 'Company name',
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
                onChanged: (v) {},
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Tags',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                color: AppColors.nutralBlack1,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            ColoredBox(
              // height: 50,
              color: AppColors.textFieldBackground,
              child: TextFormField(
                controller: controller.tags,
                cursorColor: AppColors.primaryBlue1,
                autocorrect: false,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  hintText: 'Add a tag',
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
                onChanged: (v) {},
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Email',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                color: AppColors.nutralBlack1,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            ColoredBox(
              // height: 50,
              color: AppColors.textFieldBackground,
              child: TextFormField(
                controller: controller.email,
                cursorColor: AppColors.primaryBlue1,
                autocorrect: false,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  hintText: 'Enter Email address',
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
                onChanged: (v) {},
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Mobile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                color: AppColors.nutralBlack1,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            ColoredBox(
              // height: 50,
              color: AppColors.textFieldBackground,
              child: TextFormField(
                controller: controller.mobile,
                keyboardType: TextInputType.number,
                cursorColor: AppColors.primaryBlue1,
                autocorrect: false,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  hintText: 'Enter phone number',
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
                onChanged: (v) {},
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Folder',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                color: AppColors.nutralBlack1,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            DropdownButtonFormField<String>(
              dropdownColor: Colors.white,
              isExpanded: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: AppColors.textFieldBackground,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              borderRadius: BorderRadius.circular(6.r),
              value: controller.selectFolder,
              hint: const Text('Select Folder'),
              onChanged: (String? value) {
                controller.setFolder(value!);
              },
              items: controller.folderList.map((item) {
                return DropdownMenuItem<String>(
                  value: item as String,
                  child: Text(item),
                );
              }).toList(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Reset',
                    textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: 'Poppins', color: AppColors.red),
                    borderColor: AppColors.red,
                    primaryColored: false,
                    onPressed: controller.reset,
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: CustomButton(
                    text: 'Submit',
                    onPressed: () {
                      controller.saveCustomerContact(
                        CustomerContactModel(
                          customerContactId: controller.customerList.length + 1,
                          name: controller.name.text,
                          refCode: controller.refCode.text,
                          companyName: controller.company.text,
                          email: controller.email.text,
                          folderName: controller.selectFolder,
                          mobile: controller.mobile.text,
                          tags: controller.tags.text,
                        ),
                      );
                      Get.to<void>(const CustomerContactListView());
                      /*  controller.addRegionalSetting(CalendarSettingModel(
                          serviceCalendar: controller.selectedServiceCalender.toString(),
                          officeCalendar: controller.selectedOfficeCalender.toString(),
                          endAt: controller.endAt.toString(),
                          startAt: controller.endAt.toString(),
                          taskDuration: controller.taskDuration.toString()));*/
/*
                      Get.to(const CalenderSettingView());
*/
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
