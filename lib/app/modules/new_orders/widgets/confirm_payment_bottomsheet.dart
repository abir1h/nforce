import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/model/company_payment_options.dart';
import 'package:nuforce/app/modules/new_orders/views/payment_options_controller.dart';

import 'package:nuforce/app/shared/widgets/payment_tile.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

class ConfirmPaymentBottomSheet extends StatefulWidget {
  const ConfirmPaymentBottomSheet({
    required this.paymentOption,
    this.cardNumber,
    this.canChange = false,
    super.key,
  });
  final String? cardNumber;
  final bool canChange;
  final PaymentOption paymentOption;

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
                'Confirm Payment',
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
                title: widget.paymentOption.name ?? '',
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
              PrimaryButton(
                onPressed: () {
                  // final invoiceController = Get.find<InvoiceController>();
                  // invoiceController.updateSelectedPaymentMethod(
                  //   PaymentMethodModel(
                  //     paymentMethodType: widget.paymentMethodType,
                  //     paymentMethodSvgIcon: Assets.images.svg.paymentOptions,
                  //     cardNumber: widget.cardNumber,
                  //     amount: '499', // invoiceController.dueAmount.toString(),
                  //     date: DateTime.now(),
                  //     dueDate: DateTime.now().add(const Duration(days: 30)),
                  //     remainingAmount: '\$50.00',
                  //     paymentTerm: 'Payment terms',
                  //   ),
                  // );

                  final paymentOptionsController = Get.find<PaymentOptionsController>();
                  paymentOptionsController.selectedPaymentOption = PaymentOption(
                    id: 1,
                    name: widget.paymentOption.name,
                  );
                  Fluttertoast.showToast(msg: 'Payment Method Confirmed');
                  Get.back();
                },
                text: 'Confirm Payment',
              ),
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
