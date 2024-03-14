import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/controllers/invoice_controller.dart';
import 'package:nuforce/app/modules/new_orders/models/payment_method_model.dart';
import 'package:nuforce/app/modules/new_orders/widgets/confirm_payment_bottomsheet.dart';
import 'package:nuforce/app/shared/widgets/custom_text_field.dart';
import 'package:nuforce/app/shared/widgets/payment_tile.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/app/model/card_model.dart' as card_model;

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
            child: GetBuilder<InvoiceController>(
              builder: (controller) {
                return Column(
                  children: [
                    if (controller.savedCard != null)
                      PaymentTile(
                        onTap: () {
                          Get.back();
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                            ),
                            context: context,
                            builder: (ctx) {
                              return ConfirmPaymentBottomSheet(
                                cardNumber: controller.savedCard?.cardNumber,
                                canChange: true,
                                paymentMethodType: PaymentMethodType.card,
                              );
                            },
                          );
                        },
                        cardNumber: '**** **** **** 1234',
                        iconSvgPath: Assets.images.svg.paymentOptions,
                        title: 'Card',
                      )
                    else
                      PaymentTile(
                        onTap: () {
                          Get.back();
                          showModalBottomSheet(
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                            ),
                            context: context,
                            builder: (ctx) {
                              return Padding(
                                padding: MediaQuery.of(ctx).viewInsets,
                                child: const AddCardBottomSheet(),
                              );
                            },
                          );
                        },
                        title: 'Add Card',
                        trailing: IgnorePointer(
                          ignoring: true,
                          child: TextButton(onPressed: () {}, child: const Text('+ Add Card')),
                        ),
                      ),
                    10.h.vSpace,
                    PaymentTile(
                      onTap: () {
                        Get.back();
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                          ),
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
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                          ),
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
                );
              },
            ),
          ),
          16.h.vSpace,
        ],
      ),
    );
  }
}

class AddCardBottomSheet extends StatefulWidget {
  const AddCardBottomSheet({
    super.key,
  });

  @override
  State<AddCardBottomSheet> createState() => _AddCardBottomSheetState();
}

class _AddCardBottomSheetState extends State<AddCardBottomSheet> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

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
                'Add New Card',
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
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: 'First Name',
                      hint: 'Enter First Name',
                      controller: firstNameController,
                    ),
                  ),
                  10.w.hSpace,
                  Expanded(
                    child: CustomTextField(
                      label: 'Last Name',
                      hint: 'Enter Last Name',
                      controller: lastNameController,
                    ),
                  ),
                ],
              ),
              16.h.vSpace,
              CustomTextField(
                label: 'Card Number',
                hint: 'Enter Card Number',
                controller: cardNumberController,
              ),
              16.h.vSpace,
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: 'Expiry Date',
                      hint: 'MM/YY',
                      controller: expiryDateController,
                    ),
                  ),
                  10.w.hSpace,
                  Expanded(
                    child: CustomTextField(
                      label: 'CVV',
                      hint: 'Enter CVV',
                      controller: cvvController,
                    ),
                  ),
                ],
              ),
              16.h.vSpace,
              PrimaryButton(
                onPressed: () {
                  final controller = Get.find<InvoiceController>();
                  controller.updateSavedCard(
                    card_model.Card(
                      cardNumber: cardNumberController.text,
                      cardHolderName: '${firstNameController.text} ${lastNameController.text}',
                      expiryDate: expiryDateController.text,
                      cvv: cvvController.text,
                      cardType: 'Visa',
                    ),
                  );
                  Get.back();
                },
                text: 'Add Card',
              ),
              16.h.vSpace,
            ],
          ),
        ),
        16.h.vSpace,
      ],
    );
  }
}
