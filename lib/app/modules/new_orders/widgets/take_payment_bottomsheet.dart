import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/models/payment_method_model.dart';
import 'package:nuforce/app/modules/new_orders/widgets/confirm_payment_bottomsheet.dart';
import 'package:nuforce/app/shared/widgets/payment_tile.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/gen/assets.gen.dart';

class TakePaymentBottomSheet extends StatelessWidget {
  const TakePaymentBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
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
                  onTap: () {
                    Get.back();
                    showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return const ConfirmPaymentBottomSheet(
                          cardNumber: '**** **** **** 5696',
                          canChange: true,
                          paymentMethodType: PaymentMethodType.card,
                        );
                      },
                    );
                  },
                  cardNumber: '**** **** **** 1234',
                  iconSvgPath: Assets.images.svg.paymentOptions,
                  title: 'Card',
                ),
                10.h.vSpace,
                PaymentTile(
                  onTap: () {
                    Get.back();
                    showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return const ConfirmPaymentBottomSheet(
                          paymentMethodType: PaymentMethodType.cash,
                        );
                      },
                    );
                  },
                  iconSvgPath: Assets.images.svg.paymentOptions,
                  title: 'Cash',
                ),
                10.h.vSpace,
                PaymentTile(
                  onTap: () {
                    Get.back();
                    showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return const ConfirmPaymentBottomSheet(
                          paymentMethodType: PaymentMethodType.check,
                        );
                      },
                    );
                  },
                  iconSvgPath: Assets.images.svg.paymentOptions,
                  title: 'Check',
                ),
                10.h.vSpace,
                PaymentTile(
                  onTap: () {},
                  iconSvgPath: Assets.images.svg.paymentOptions,
                  title: 'Stripe',
                  trailing: TextButton(onPressed: () {}, child: const Text('Connect')),
                ),
                10.h.vSpace,
                PaymentTile(
                  onTap: () {},
                  iconSvgPath: Assets.images.svg.paymentOptions,
                  title: 'NuForce Pay',
                  trailing: TextButton(onPressed: () {}, child: const Text('Connect')),
                ),
                10.h.vSpace,
                PaymentTile(
                  onTap: () {},
                  iconSvgPath: Assets.images.svg.paymentOptions,
                  title: 'Direct Debit',
                ),
              ],
            ),
          ),
          16.h.vSpace,
        ],
      ),
    );
  }
}
