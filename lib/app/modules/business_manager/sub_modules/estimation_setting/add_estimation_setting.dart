import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/business_manager/controllers/estimation_controller.dart';
import 'package:nuforce/app/modules/business_manager/models/estimation_setting_model.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/estimation_setting/widgets/chip_textField.dart';
import 'estimation_settings_view.dart';
import '../../../../utils/text_styles.dart';
import '../regional_setting/widget/custom_button.dart';
import '../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../utils/colors.dart';

class AddEstimationSetting extends StatefulWidget {
  const AddEstimationSetting({super.key});

  @override
  State<AddEstimationSetting> createState() => _AddEstimationSettingState();
}

class _AddEstimationSettingState extends State<AddEstimationSetting> {
  final controller = Get.find<EstimationSettingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppbarMinimal(
        title: 'Estimation Settings',
      ),
      body: GetBuilder<EstimationSettingController>(builder: (_) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Expiration Period",
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 14.sp, color: AppColors.nutralBlack1),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    // height: 50,
                    color: AppColors.textFieldBackground,
                    child: TextFormField(
                      cursorColor: AppColors.primaryBlue1,
                      autocorrect: false,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        hintText: "Enter expiration period",
                        hintStyle: CustomTextStyle.paragraphSmall.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.greyText,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.greyText,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.primaryBlue1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onChanged: (v) {
                        controller.setExpiration(v);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text(
                      "Days offer expires after issuing",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp, fontFamily: "Poppins", color: AppColors.greyText),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Advance Payment",
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 14.sp, color: AppColors.nutralBlack1),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    // height: 50,
                    color: AppColors.textFieldBackground,
                    child: TextFormField(
                      cursorColor: AppColors.primaryBlue1,
                      autocorrect: false,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        hintText: "Enter advance payment",
                        hintStyle: CustomTextStyle.paragraphSmall.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.greyText,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.greyText,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.primaryBlue1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onChanged: (v) {
                        controller.setExpiration(v);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Cancellation Fee",
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 14.sp, color: AppColors.nutralBlack1),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    // height: 50,
                    color: AppColors.textFieldBackground,
                    child: TextFormField(
                      cursorColor: AppColors.primaryBlue1,
                      autocorrect: false,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        hintText: "Enter cancellation fee",
                        hintStyle: CustomTextStyle.paragraphSmall.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.greyText,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.greyText,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.primaryBlue1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onChanged: (v) {
                        controller.setExpiration(v);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Tax Exempt",
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 14.sp, color: AppColors.nutralBlack1),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: AppColors.textFieldBackground,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    borderRadius: BorderRadius.circular(6.r),
                    value: controller.selectTaxExempt,
                    onChanged: (String? value) {
                      controller.setTaxtExempt(value!);
                    },
                    items: controller.taxExemptList.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Lock Estimation File on Issuing",
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 14.sp, color: AppColors.nutralBlack1),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: AppColors.textFieldBackground,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    borderRadius: BorderRadius.circular(6.r),
                    value: controller.selectLockEstimation,
                    onChanged: (String? value) {
                      controller.setLockEstimation(value!);
                    },
                    items: controller.lockEstimationList.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Issue as Active Offer",
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 14.sp, color: AppColors.nutralBlack1),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: AppColors.textFieldBackground,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    borderRadius: BorderRadius.circular(6.r),
                    value: controller.selectIssues,
                    onChanged: (String? value) {
                      controller.setIssue(value!);
                    },
                    items: controller.issuesList.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Common Policies",
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 14.sp, color: AppColors.nutralBlack1),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  ChipTextField(
                    controller: controller.commonPoliceController,
                    hintText: "Enter Policy One by one",
                  )
                ]),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Reset",
                        textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, fontFamily: "Poppins", color: AppColors.red),
                        borderColor: AppColors.red,
                        primaryColored: false,
                        onPressed: () {
                          controller.reset();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: CustomButton(
                        text: "Submit",
                        primaryColored: true,
                        onPressed: () {
                          controller.addEstimationData(EstimationSettingModel(
                              expirationPeriod: controller.expirationPeriod.toString(),
                              advancePayment: controller.advancePayment.toString(),
                              cancellationFee: controller.cancellationFee.toString(),
                              taxExempt: controller.selectTaxExempt.toString(),
                              lockEstimation: controller.selectLockEstimation.toString(),
                              issue: controller.selectIssues.toString(),
                              commonPolices: controller.commonPolices));
                          Get.to(const EstimationSettingView());
                          /*     controller.addRegionalSetting(
                                  CalendarSettingModel(serviceCalendar: controller.selectedServiceCalender.toString(),
                                      officeCalendar: controller.selectedOfficeCalender.toString(),
                                      endAt: controller.endAt.toString(),startAt:controller.endAt.toString() ,taskDuration:controller.taskDuration.toString() ));
                            Get.to(const CalenderSetting());*/
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
