import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../../../../../../../shared/widgets/custom_dropdown.dart';
import '../../../../../../../shared/widgets/primary_button.dart';
import '../../../../../../../shared/widgets/secondary_button.dart';
import '../controllers/over_view_controller.dart';

class EditWorkOrder extends GetView<OverViewController> {
  const EditWorkOrder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgWithOpacity,
        appBar: const CustomAppbarMinimal(
          title: "Edit Work Order",
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  ).then((value) {});
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start Date',
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
                            'DD-MM-YY',
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
                'Agent Name',
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
                    value: 'Jerome Bell',
                    child: Text(
                      'Jerome Bell',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Jerome Bell',
                    child: Text(
                      'Jerome Bell',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Jerome Bell',
                    child: Text(
                      'Jerome Bell',
                    ),
                  ),
                ],
                hint: 'Jerome Bell',
                onChanged: (newVal) {},
                value: null,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                  label: "Contact",
                  hint: "Aron Taylor",
                  controller: TextEditingController()),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Work order no.',
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
                    value: 'WOAT351 WOAT351',
                    child: Text(
                      'Jerome Bell',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'WOAT351',
                    child: Text(
                      'JWOAT351l',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'WOAT351',
                    child: Text(
                      'WOAT351',
                    ),
                  ),
                ],
                hint: 'WOAT351',
                onChanged: (newVal) {},
                value: null,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Work type',
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
                    value: 'WGenaral',
                    child: Text(
                      'Genaral',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Genaral',
                    child: Text(
                      'Genaral',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Genaral',
                    child: Text(
                      'Genaral',
                    ),
                  ),
                ],
                hint: 'Genaral',
                onChanged: (newVal) {},
                value: null,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Service Package',
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
                    value: 'WGenaral',
                    child: Text(
                      'Insect Removal',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Genaral',
                    child: Text(
                      'Genaral',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Genaral',
                    child: Text(
                      'Genaral',
                    ),
                  ),
                ],
                hint: 'Insect Removal',
                onChanged: (newVal) {},
                value: null,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Priority',
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
                    value: 'WGenaral',
                    child: Text(
                      'Insect Removal',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Genaral',
                    child: Text(
                      'Genaral',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Genaral',
                    child: Text(
                      'Genaral',
                    ),
                  ),
                ],
                hint: 'Priority',
                onChanged: (newVal) {},
                value: null,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                  label: "Zip Code",
                  hint: 'Enter Zip Code',
                  controller: TextEditingController()),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                  label: "Tax",
                  hint: 'Enter tax',
                  controller: TextEditingController()),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Use % sign to dictate percentage',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: AppColors.nutralBlack2),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                  label: "Discount",
                  hint: 'Enter discount',
                  controller: TextEditingController()),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Use % sign to dictate percentage',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: AppColors.nutralBlack2),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                  label: "Discount note",
                  hint: 'Write discount notes...',
                  maxLines: 3,
                  controller: TextEditingController()),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                  label: "Cancellation Fee",
                  hint: '10%',
                  maxLines: 3,
                  controller: TextEditingController()),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                  label: "Minimum partial payment",
                  hint: '10%',
                  maxLines: 3,
                  controller: TextEditingController()),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'If payment is required, enter minimum amount for partial payment',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: AppColors.nutralBlack2),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Exempt tax',
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
                    value: 'WGenaral',
                    child: Text(
                      'Insect Removal',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Genaral',
                    child: Text(
                      'Genaral',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Genaral',
                    child: Text(
                      'Genaral',
                    ),
                  ),
                ],
                hint: 'Priority',
                onChanged: (newVal) {},
                value: null,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Auto activated on receiving initial payment',
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
                    value: 'WGenaral',
                    child: Text(
                      'Insect Removal',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Genaral',
                    child: Text(
                      'Genaral',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Genaral',
                    child: Text(
                      'Genaral',
                    ),
                  ),
                ],
                hint: 'Priority',
                onChanged: (newVal) {},
                value: null,
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Auto charge due amount on completion',
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
                    value: 'WGenaral',
                    child: Text(
                      'Insect Removal',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Genaral',
                    child: Text(
                      'Genaral',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Genaral',
                    child: Text(
                      'Genaral',
                    ),
                  ),
                ],
                hint: 'Priority',
                onChanged: (newVal) {},
                value: null,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        Get.back();
                      },
                      text: 'Reset',
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        Get.back();
                      },
                      text: 'Save',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
            ],
          ),
        ));
  }
}

class TimeLineCard extends StatelessWidget {
  const TimeLineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      constraints: const BoxConstraints(
        minHeight: 120,
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Created work order WOAT351 for Aaron Taylor',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyle.commonBold,
          ),
          Text(
            'Dilruba Khanam Jesey',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyle.heading5
                .copyWith(color: AppColors.nutralBlack2, fontFamily: "Poppins"),
          ),
          Text(
            '25 Jan 2023 - 08:30PM',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyle.heading5
                .copyWith(color: AppColors.nutralBlack2, fontFamily: "Poppins"),
          ),
        ],
      ),
    );
  }
}

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'AT35- 2308105',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyle.commonBold,
              ),
              Text(
                r'$500.00',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyle.commonBold,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Due to: 27 Aug, 2023',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyle.heading5.copyWith(
                    color: AppColors.nutralBlack2, fontFamily: "Poppins"),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    color: AppColors.lightYellow2),
                child: Text(
                  "pending",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    fontFamily: "Poppins",
                    color: AppColors.darkYellow,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          SizedBox(
            height: 30.h,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.primaryBlue1),
                    child: Center(
                      child: Text(
                        "View Invoice",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          fontFamily: "Poppins",
                          color: AppColors.white1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: AppColors.primaryBlue1),
                        color: AppColors.white1),
                    child: Center(
                      child: Text(
                        "Customer Preview",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          fontFamily: "Poppins",
                          color: AppColors.primaryBlue1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
