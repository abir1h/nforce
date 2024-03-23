import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/routes/app_pages.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../shared/widgets/custom_dropdown.dart';
import '../../../../../shared/widgets/custom_text_field.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../../../../../shared/widgets/secondary_button.dart';
import '../../../../../utils/colors.dart';


class AddLineItem extends StatefulWidget {
  const AddLineItem({super.key});

  @override
  State<AddLineItem> createState() => _AddLineItemState();
}

class _AddLineItemState extends State<AddLineItem> {
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
          title: 'Add New Line item',
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Type',
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
                items: const [
                  DropdownMenuItem(
                    value: 'Service ',
                    child: Text(
                      'Service ',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Product',
                    child: Text(
                      'Product',
                    ),
                  ),
                ],
                hint: 'Enter contact Name',
                onChanged: (newVal) {},
                value: null,
              ),
              CustomTextField(
                  label: "Name",
                  hint: "Enter Contact Name",
                  controller: TextEditingController()),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                  label: "Description",
                  hint: "Write description...",
                  maxLines: 3,
                  controller: TextEditingController()),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                  label: "Unit Price",
                  hint: "Unit Price",
                  keyboardType: TextInputType.number,
                  controller: TextEditingController()),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                  label: "Discount",
                  hint: "Ex: 5 %",
                  keyboardType: TextInputType.number,
                  controller: TextEditingController()),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Quantity',
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
                items: const [
                  DropdownMenuItem(
                    value: 'X',
                    child: Text(
                      '1',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Y',
                    child: Text(
                      '2',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Z',
                    child: Text(
                      '3',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total billing amount',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        fontFamily: "Poppins",
                        color: AppColors.nutralBlack2),
                  ),
                  Text(
                    r'$10,000.00',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        fontFamily: "Poppins",
                        color: AppColors.nutralBlack2),
                  ),
                ],
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
