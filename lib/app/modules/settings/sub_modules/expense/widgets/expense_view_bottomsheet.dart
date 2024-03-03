import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../../../../../shared/widgets/custom_dropdown.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../../../../../shared/widgets/secondary_button.dart';

class ExpenseViewBottomsheet extends StatefulWidget {
  const ExpenseViewBottomsheet({
    super.key,
  });

  @override
  State<ExpenseViewBottomsheet> createState() => _ExpenseViewBottomsheetState();
}

class _ExpenseViewBottomsheetState extends State<ExpenseViewBottomsheet> {
  String selectedValue = 'None';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: mediaQuery.padding.top * 5),
          padding: EdgeInsets.only(top: 16.h, right: 16.w, left: 20.w),
          decoration: BoxDecoration(
            color: AppColors.white1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Filter",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Status',
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
              CustomTextField(
                label: 'Person',
                hint: "Enter person name",
                controller: TextEditingController(),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Expense Code',
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
              GestureDetector(
                onTap: () {
                  showCustomDateRangePicker(
                    context,
                    dismissible: true,
                    minimumDate:
                        DateTime.now().subtract(const Duration(days: 30)),
                    maximumDate: DateTime.now().add(const Duration(days: 30)),
                    backgroundColor: Colors.white,
                    primaryColor: AppColors.primaryBlue1,
                    onApplyClick: (start, end) {},
                    onCancelClick: () {},
                  );
                },
                child: CustomTextField(
                    label: 'Date range',
                    hint: "DD-MM-YYYY : DD-MM-YYYY",
                    enable: false,
                    suffix: Icon(Icons.calendar_month),
                    controller: TextEditingController(),),
              ),
              Padding(
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
                          Get.back();

                        },
                        text: 'Apply',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
