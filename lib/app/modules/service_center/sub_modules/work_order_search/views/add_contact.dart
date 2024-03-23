import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/routes/app_pages.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../shared/widgets/custom_dropdown.dart';
import '../../../../../shared/widgets/custom_phone_input.dart';
import '../../../../../shared/widgets/custom_text_field.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../../../../../shared/widgets/secondary_button.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/text_styles.dart';
import '../../../../service_items/widgets/tags_input_field.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColors.bgWithOpacity,
        resizeToAvoidBottomInset: true,
        appBar: const CustomAppbarMinimal(
          title: 'Add New Contact',
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(label: "Name*", hint: "Enter Contact Name", controller: TextEditingController()),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(label: "Ref Code", hint: "Enter code", controller: TextEditingController()),
              Text(
                'Internal Customer No or Ref Code',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.nutralBlack2),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(label: "Company", hint: "Enter company name", controller: TextEditingController()),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Tag",
                style: CustomTextStyle.paragraphSmall.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.nutralBlack1,
                  // fontSize: 20,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              const TagsInputField(),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(label: "Email", hint: "Enter email address", controller: TextEditingController()),
              Text(
                'Active email address',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp, color: AppColors.nutralBlack2),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomPhoneInput(label: "Phone Number ", hint: "Enter number", controller: TextEditingController()),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Contact Type',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: AppColors.nutralBlack1,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomDropdownButton(
                items: [
                  DropdownMenuItem(
                    value: 'X',
                    child: Text(
                      'x',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Y',
                    child: Text(
                      'X',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Z',
                    child: Text(
                      'z',
                    ),
                  ),
                ],
                hint: 'Select one',
                onChanged: (newVal) {},
                value: null,
              ),
              SizedBox(
                height: 16.h,
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
                        Get.toNamed(Routes.WORK_ORDER_SEARCH);
                      },
                      text: 'Add',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
