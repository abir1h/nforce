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
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                    SizedBox(height: 8.h),
                    CustomDropdownButton(
                      items: expenseCodes
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      hint: 'Select one',
                      onChanged: (newVal) {
                        setState(() {
                          selectedExpenseCode = newVal as String;
                        });
                      },
                      value: selectedExpenseCode,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      label: 'Item name',
                      hint: 'Enter item name',
                      controller: itemNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter item name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      label: 'Spend By',
                      hint: 'Enter spend by',
                      controller: spendByController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter spend by';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
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
                                  expireDate = value;
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
                                        expireDate != null ? DatetimeCustomFunc.getDashedDate(expireDate!) : 'Select date',
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
                        SizedBox(width: 15.w),
                        Expanded(
                          child: CustomTextField(
                            label: 'Duration Time',
                            hint: 'Enter duration in minutes',
                            controller: durationController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter duration';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      label: r'Total $',
                      hint: r'$0.00',
                      controller: totalAmountController,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Fund Source',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomDropdownButton(
                      items: fundSources
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      hint: 'Select one',
                      onChanged: (newVal) {
                        setState(() {
                          selectedFundSource = newVal as String;
                        });
                      },
                      value: selectedFundSource,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      label: 'Details',
                      hint: 'Write description...',
                      maxLines: 4,
                      controller: detailsController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter details';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Reimburse to',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomDropdownButton(
                      items: reimbursableTo
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      hint: 'Not Reimbursable',
                      onChanged: (newVal) {
                        setState(() {
                          selectedReimbursableTo = newVal as String;
                        });
                      },
                      value: selectedReimbursableTo,
                    ),
                    SizedBox(height: 16.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              pickImage(ImageSource.gallery).then(
                                (image) {
                                  if (image != null) {
                                    setState(() {
                                      images.add(image);
                                    });
                                  }
                                },
                              );
                            },
                            child: DottedRect(
                              color: Colors.grey,
                              gap: 5,
                              child: Container(
                                height: 70.h,
                                width: 70.h,
                                padding: EdgeInsets.all(20.r),
                                child: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70.h,
                            child: ListView.builder(
                              itemCount: images.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return AlertDialog(
                                          title: const Text('Remove Image'),
                                          content: const Text('Are you sure you want to remove this image?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Get.back();
                                                setState(() {
                                                  images.removeAt(index);
                                                });
                                              },
                                              child: const Text('Remove'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 70.h,
                                        width: 70.h,
                                        margin: EdgeInsets.only(left: 10.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.r),
                                          color: AppColors.primaryBlue1,
                                          image: DecorationImage(
                                            image: FileImage(File(images[index].path)),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 5,
                                        top: 5,
                                        child: Container(
                                          height: 20.h,
                                          width: 20.h,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: AppColors.red),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.close,
                                            size: 16,
                                            color: AppColors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    50.h.vSpace,
                  ],
                ),
              ),
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
