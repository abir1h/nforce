import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_checkbox.dart';
import 'package:nuforce/app/shared/widgets/custom_dropdown.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/secondary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

class AddPayment extends StatefulWidget {
  const AddPayment({super.key});

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  String? selectedDate;

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbarMinimal(
        title: 'Add Payment',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone Number ',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.nutralBlack1,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
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
                    hintStyle: CustomTextStyle.paragraphSmall.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.white3,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  onInputChanged: (PhoneNumber number) {
                    // var phoneNumber = number.phoneNumber!;
                  },
                  onInputValidated: (bool value) {},
                  selectorConfig: const SelectorConfig(
                    trailingSpace: false,
                  ),
                  ignoreBlank: true,
                  selectorTextStyle: const TextStyle(color: AppColors.subText),
                  textFieldController: TextEditingController(),
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true,
                  ),
                  inputBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.greyText),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  onSaved: print,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Work order ID',
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
                    'VDGDDGGDG',
                  ),
                ),
                DropdownMenuItem(
                  value: 'Y',
                  child: Text(
                    'FBBFFBFBB',
                  ),
                ),
                DropdownMenuItem(
                  value: 'Z',
                  child: Text(
                    'FBFBDDBDBD',
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
            Text(
              'Payment Method',
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
                    'Bank',
                  ),
                ),
                DropdownMenuItem(
                  value: 'Y',
                  child: Text(
                    'Check',
                  ),
                ),
              ],
              hint: 'Select one',
              onChanged: (newVal) {},
              value: null,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "This will be displayed in the invoice and emails",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: AppColors.nutralBlack2,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              controller: TextEditingController(),
              hint: 'Enter bank name',
              label: 'Bank Name',
              onChanged: (v) {},
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              controller: TextEditingController(),
              hint: 'Enter account no',
              label: 'Account No',
              onChanged: (v) {},
            ),
            SizedBox(
              height: 16.h,
            ),
            GestureDetector(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                ).then((value) {
                  setState(() {
                    selectedDate = '${value!.day}-${value.month}-${value.year}';
                  });
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
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
                          selectedDate ?? 'DD-MM-YYYY',
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
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Status',
              style: CustomTextStyle.paragraphSmall.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.nutralBlack1,
                // fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            CustomDropdownButton(
              items: const [
                DropdownMenuItem(
                  value: 'X',
                  child: Text(
                    'Approve',
                  ),
                ),
                DropdownMenuItem(
                  value: 'Y',
                  child: Text(
                    'Pending',
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
              controller: TextEditingController(),
              hint: 'Write details',
              label: 'Additional Details',
              maxLines: 4,
              onChanged: (v) {},
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "This will be displayed in the invoice and emails",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: AppColors.nutralBlack2,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                CustomCheckbox(
                  activeColor: isSelected == false ? Colors.grey.withOpacity(.4) : AppColors.primaryBlue1,
                  value: isSelected,
                  onChanged: (v) {
                    setState(() {
                      isSelected = v!;
                    });
                  },
                ),
                Text.rich(
                  style: TextStyle(
                    color: AppColors.nutralBlack2,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    fontFamily: "Poppins",
                  ),
                  TextSpan(
                    text: 'Agree with ',
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Terms ',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          fontFamily: "Poppins",
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(
                          color: AppColors.nutralBlack2,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          fontFamily: "Poppins",
                        ),
                      ),
                      TextSpan(
                        text: 'Conditions',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Total billing amount",
                    style: TextStyle(
                      color: AppColors.nutralBlack2,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                Text(
                  "\$100000",
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
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
                      Get.back();
                    },
                    text: 'Submit',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
