import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:nuforce/app/modules/business_manager/controllers/customer_contact_controller.dart';
import 'package:nuforce/app/modules/business_manager/models/customer_contact_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/customer_contact_add_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/customer_contact/customer_contact_list_view.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/regional_setting/widget/custom_button.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/regional_setting/widget/custom_text_block.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/utils/colors.dart';

class CustomerContactDetailsView extends StatefulWidget {
  final CustomerContactModel mainModel;
  const CustomerContactDetailsView({
    required this.mainModel,
    super.key,
  });

  @override
  State<CustomerContactDetailsView> createState() => _CustomerContactDetailsViewState();
}

class _CustomerContactDetailsViewState extends State<CustomerContactDetailsView> {
  final controller = Get.put(CustomerContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      appBar: CustomAppbarMinimal(
        title: 'Details',
        leadingPressed: () {
          Get.to<void>(const CustomerContactListView());
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextBlock(
              label: 'Name',
              value: widget.mainModel.name!,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextBlock(
              label: 'Ref Code',
              value: widget.mainModel.refCode!,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextBlock(
              label: 'Tags',
              value: widget.mainModel.tags!,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextBlock(
              label: 'Company',
              value: widget.mainModel.companyName!,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextBlock(
              label: 'Email',
              value: widget.mainModel.email!,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextBlock(
              label: 'Mobile',
              value: widget.mainModel.mobile!,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextBlock(
              label: 'Folder',
              value: widget.mainModel.folderName!,
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Delete',
                    textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: 'Poppins', color: AppColors.red),
                    borderColor: AppColors.red,
                    primaryColored: false,
                    onPressed: () {
                      //controller.reset();
                    },
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: CustomButton(
                    text: 'Edit',
                    onPressed: () {
                      /* controller.saveCustomerContact(CustomerContactModel(
                        customerContactId: controller.customerList.length + 1,
                        name: controller.name.text,
                        refCode: controller.refCode.text,
                        companyName: controller.company.text,
                        email: controller.email.text,
                        folderName: controller.selectFolder,
                        mobile: controller.mobile.text,
                        tags: controller.tags.text,
                      ));*/
                      controller.populateFieldsFromModel(widget.mainModel);

                      Get.to<void>(const CustomerContactAddView());
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
