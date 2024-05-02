import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuforce/app/modules/settings/sub_modules/addons/widgets/dotted_border.dart';
import 'package:nuforce/app/modules/settings/sub_modules/expense/controllers/add_new_expense_controller.dart';
import 'package:nuforce/app/shared/functions/image_picker_func.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/datetime_custom_func.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

class AddExpenseViewScreen extends StatefulWidget {
  const AddExpenseViewScreen({super.key});

  @override
  State<AddExpenseViewScreen> createState() => _AddExpenseViewScreenState();
}

class _AddExpenseViewScreenState extends State<AddExpenseViewScreen> {
  final addExpenseFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    itemNameController.dispose();
    spendByController.dispose();
    totalAmountController.dispose();
    detailsController.dispose();
    durationController.dispose();
    super.dispose();
  }

  List<String> expenseCodes = ['X', 'Y', 'Z'];
  String? selectedExpenseCode;

  List<String> fundSources = ['A', 'B', 'C'];
  String? selectedFundSource;

  TextEditingController itemNameController = TextEditingController();
  TextEditingController spendByController = TextEditingController();

  DateTime? expireDate;
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  List<XFile> images = [];

  List<String> reimbursableTo = ['A', 'B', 'C'];
  String? selectedReimbursableTo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: const CustomAppbarMinimal(
        title: 'Add New Expense',
      ),
      body: Form(
        key: addExpenseFormKey,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {},
                      text: 'Reset',
                    ),
                  ),
                  10.w.hSpace,
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        if (addExpenseFormKey.currentState!.validate()) {
                          Get.find<AddNewExpenseController>()
                              .addExpense(
                            MockExpense(
                              expenseCode: selectedExpenseCode!,
                              name: itemNameController.text,
                              spendBy: spendByController.text,
                              expireDate: expireDate!,
                              duration: Duration(minutes: int.tryParse(durationController.text) ?? 0),
                              totalAmount: totalAmountController.text,
                              fundSource: selectedFundSource!,
                              details: detailsController.text,
                              reimbursable: selectedReimbursableTo!,
                              images: images,
                            ),
                          )
                              .then((value) {
                            if (value) {
                              Get.back();
                              Fluttertoast.showToast(msg: 'Expense saved successfully!');
                            }
                          });
                        }
                      },
                      text: 'Save',
                    ),
                  ),
                ],
              ),
            ),
            20.h.vSpace,
          ],
        ),
      ),
    );
  }
}
