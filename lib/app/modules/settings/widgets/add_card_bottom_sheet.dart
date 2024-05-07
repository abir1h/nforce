import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/subscriptions/controller/subscription_controller.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../../../../gen/assets.gen.dart';
import '../../../shared/widgets/custom_text_field.dart';
import '../../../shared/widgets/primary_button.dart';
import '../../../shared/widgets/secondary_button.dart';
import '../../../utils/text_styles.dart';

class AddCardBottomsheet extends StatefulWidget {
  const AddCardBottomsheet({
    super.key,
  });

  @override
  State<AddCardBottomsheet> createState() => _AddCardBottomsheetState();
}

class _AddCardBottomsheetState extends State<AddCardBottomsheet> {
  final controller = Get.put(SubscriptionController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return GetBuilder<SubscriptionController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 10.h, right: 16.w, left: 20.w),
              decoration: BoxDecoration(
                color: AppColors.white1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add New Card',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                            color: AppColors.nutralBlack1),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.clear,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  CustomTextField(
                    label: 'Card Number*',
                    hint: 'Enter card number',
                    controller: TextEditingController(),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    label: 'Card Holder Name*',
                    hint: 'Enter name',
                    controller: TextEditingController(),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: 'MM/YY*',
                          hint: 'MM/YY',
                          suffix: Icon(Icons.calendar_today),
                          controller: TextEditingController(),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: CustomTextField(
                          label: 'CVV*',
                          hint: 'CVV',
                          suffix: Icon(Icons.info_outline),
                          controller: TextEditingController(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: SecondaryButton(
                            onPressed: () => Get.back(),
                            text: 'Reset',
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () => Get.back(),
                            text: 'Save',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
