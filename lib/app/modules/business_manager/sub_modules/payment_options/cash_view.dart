import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/business_manager/controllers/cash_controller.dart';
import 'package:nuforce/app/modules/business_manager/sub_modules/payment_options/payment_option_view.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';

import '../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../utils/colors.dart';

class CashView extends StatefulWidget {
  const CashView({super.key});

  @override
  State<CashView> createState() => _CashViewState();
}

class _CashViewState extends State<CashView> {
  final controller = Get.find<CashController>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white1,      resizeToAvoidBottomInset: false,

      appBar: const CustomAppbarMinimal(
        title: 'Cash',
      ),
    body: GetBuilder<CashController>(builder: (_) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(label: "Name", hint: "Cash", controller: controller.nameController),
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Text(
                    'Name for the method, ideally "Cash"',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp, fontFamily: "Poppins", color: AppColors.nutralBlack2),
                  ),
                ),
                SizedBox(height: 16.h,),
                CustomTextField(label: "Notes", hint: "Enter notes", controller: controller.noteController),            SizedBox(height: 16.h,),
                Text(
                  "Status",
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
                  value: controller.selectStatus,
                  onChanged: (String? value) {
                    controller.setStatus(value!);
                  },
                  items: controller.statusList.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),

              ],
            ),
            PrimaryButton(onPressed: (){Get.to(const PaymentOptionView());}   , text: "Save Change",primaryColored: true,)
          ],
        ),
      );
    }

    ),
    );
  }
}