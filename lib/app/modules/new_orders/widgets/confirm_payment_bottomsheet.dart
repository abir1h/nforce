import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/shared/widgets/payment_tile.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

class ConfirmPaymentBottomSheet extends StatefulWidget {
  const ConfirmPaymentBottomSheet({
    required this.title,
    this.canChange = false,
    super.key,
  });
  final String title;
  final bool canChange;

  @override
  State<ConfirmPaymentBottomSheet> createState() => _ConfirmPaymentBottomSheetState();
}

class _ConfirmPaymentBottomSheetState extends State<ConfirmPaymentBottomSheet> {
  bool agreeToRefundPolicy = false;
  bool agreeToTermsAndCondition = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        16.h.vSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Take Payment',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.close),
              ),
            ],
          ),
        ),
        5.h.vSpace,
        const Divider(color: AppColors.nutralBlack2),
        5.h.vSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              PaymentTile(
                onTap: () {},
                iconSvgPath: Assets.images.svg.paymentOptions,
                title: widget.title,
                trailing: widget.canChange ? TextButton(onPressed: () {}, child: const Text('Change')) : null,
              ),
              10.h.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Payment',
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    '\$5,0000.00',
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              2.h.vSpace,
              const Divider(color: AppColors.nutralBlack2),
              5.h.vSpace,
              Row(
                children: [
                  Checkbox(
                    value: agreeToRefundPolicy,
                    onChanged: (v) {
                      setState(() {
                        agreeToRefundPolicy = v!;
                      });
                    },
                  ),
                  5.w.hSpace,
                  Text(
                    'Agree to ',
                    style: TextStyle(
                      color: AppColors.nutralBlack2,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Refund Policy');
                    },
                    child: Text(
                      'Refund Policy',
                      style: TextStyle(
                        color: AppColors.primaryBlue1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: agreeToTermsAndCondition,
                    onChanged: (v) {
                      setState(() {
                        agreeToTermsAndCondition = v!;
                      });
                    },
                  ),
                  5.w.hSpace,
                  Text(
                    'Agree to ',
                    style: TextStyle(
                      color: AppColors.nutralBlack2,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Refund Policy');
                    },
                    child: Text(
                      'Terms and Condition',
                      style: TextStyle(
                        color: AppColors.primaryBlue1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              10.h.vSpace,
              PrimaryButton(onPressed: () {}, text: 'Confirm Payment'),
              10.h.vSpace,
              SizedBox(
                width: width,
                child: TextButton(onPressed: () {}, child: const Text('Customer Support')),
              ),
            ],
          ),
        ),
        16.h.vSpace,
      ],
    );
  }
}
