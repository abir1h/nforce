import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/expense/view/expense_view_screen.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../shared/widgets/custom_dropdown.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../../../../../shared/widgets/secondary_button.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/text_styles.dart';
import '../../addons/widgets/dotted_border.dart';

class AddExpenseViewScreen extends StatefulWidget {
  const AddExpenseViewScreen({super.key});

  @override
  State<AddExpenseViewScreen> createState() => _AddExpenseViewScreenState();
}

class _AddExpenseViewScreenState extends State<AddExpenseViewScreen> {
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
              child: SecondaryButton(
                onPressed: () =>Get.back(),
                text: 'Reset',
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: PrimaryButton(
                onPressed: () =>Get.back(),
                text: 'Save',
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: const CustomAppbarMinimal(
        title: 'Add New Expense',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Expense code',
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
              label: 'Item name',
              hint: 'Enter item name',
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              label: 'Spend By',
              hint: 'Enter spend by',
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      ).then((value) {
                        setState(() {
                          selectedDate =
                              '${value!.day}-${value.month}-${value.year}';
                        });
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expire date',
                          style: CustomTextStyle.paragraphSmall.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.nutralBlack1,
                            // fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.textFieldBackground,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: AppColors.greyText),
                          ),
                          child: Row(
                            children: [
                              Text(
                                selectedDate,
                                style: TextStyle(
                                  color: AppColors.subText,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset(Assets.images.svg.calendarMonth),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: CustomTextField(
                    label: 'Duration Time',
                    hint: '45 Min',
                    controller: TextEditingController(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              label: r'Total $',
              hint: r'$0.00',
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Fund Source',
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
              label: 'Details',
              hint: 'Write description...',
              maxLines: 4,
              controller: TextEditingController(),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Reimburse to',
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
              hint: 'Not Reimbursable',
              onChanged: (newVal) {},
              value: null,
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                DottedRect(
                  color: Colors.grey,
                  gap: 5,
                  child: Container(
                    padding: EdgeInsets.all(20.r),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
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
