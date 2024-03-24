import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/expense/view/expense_view_screen.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../shared/widgets/custom_dropdown.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../../../../../utils/colors.dart';


class AddExpenseCodeViewScreen extends StatefulWidget {
  const AddExpenseCodeViewScreen({super.key});

  @override
  State<AddExpenseCodeViewScreen> createState() => _AddExpenseCodeViewScreenState();
}

class _AddExpenseCodeViewScreenState extends State<AddExpenseCodeViewScreen> {
  String selectedDate = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          children: [

            Expanded(
              child: PrimaryButton(
                onPressed: () {
                Get.back();
                },
                text: 'Submit Expense',
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: const CustomAppbarMinimal(
        title: 'Add New Expense Code',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [   CustomTextField(
            label: 'Code title',
            hint: 'Enter code title ',
            controller: TextEditingController(),
          ),  SizedBox(
            height: 16.h,
          ), CustomTextField(
            label: 'Code ',
            hint: 'Enter code  ',
            controller: TextEditingController(),
          ),  SizedBox(
            height: 16.h,
          ),
            Text(
              'Code type',
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
                  value: 'Expense',
                  child: Text(
                    'Expense',
                  ),
                ),
                DropdownMenuItem(
                  value: 'Payroll',
                  child: Text(
                    'Payroll',
                  ),
                ),
                DropdownMenuItem(
                  value: 'Material Cost',
                  child: Text(
                    'Material Cost',
                  ),
                ),
              ],
              hint: 'Select one',
              onChanged: (newVal) {},
              value: null,
            ),
        SizedBox(
              height: 70.h,
            ),
          ],
        ),
      ),
    );
  }
}
