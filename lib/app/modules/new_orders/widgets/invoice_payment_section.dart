import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/views/payment_options_controller.dart';
import 'package:nuforce/app/modules/new_orders/widgets/take_payment_bottomsheet.dart';
import 'package:nuforce/app/shared/widgets/details_with_header_skleton.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/datetime_custom_func.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/gen/assets.gen.dart';

class InvoicePaymentSection extends StatefulWidget {
  const InvoicePaymentSection({
    super.key,
  });

  @override
  State<InvoicePaymentSection> createState() => _InvoicePaymentSectionState();
}

class _InvoicePaymentSectionState extends State<InvoicePaymentSection> {
  final expandableController = ExpandableController(initialExpanded: true);
  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<PaymentOptionsController>()) {
      Get.find<PaymentOptionsController>();
    } else {
      Get.put(PaymentOptionsController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentOptionsController>(
      builder: (controller) {
        if (controller.isLoading) {
          const SizedBox.shrink();
        }
        if (controller.selectedPaymentOption == null) {
          return const InvoiceEmptyPaymentView();
        } else {
          return DetailsWithHeaderSkleton(
            controller: expandableController,
            header: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payments',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down, color: AppColors.nutralBlack1),
              ],
            ),
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: AppColors.white1,
                    border: Border.all(
                      color: AppColors.tableBorder,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primaryBlue3,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: SvgPicture.asset(Assets.images.svg.paymentOptions),
                      ),
                      10.w.hSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.selectedPaymentOption?.name?.toTitleCase() ?? '',
                            style: TextStyle(
                              color: AppColors.nutralBlack1,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (controller.selectedPaymentOption?.accountId != null)
                            Text(
                              '${controller.selectedPaymentOption?.accountId}',
                              style: TextStyle(
                                color: AppColors.nutralBlack2,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.selectedPaymentOption?.name ?? '',
                            style: TextStyle(
                              color: AppColors.nutralBlack1,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            DatetimeCustomFunc.getDashedDate(DateTime.now()),
                            style: TextStyle(
                              color: AppColors.nutralBlack2,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                16.h.vSpace,
                LeftRightText(
                  textKey: 'Due Date:',
                  textValue: DatetimeCustomFunc.getFormattedDate(DateTime.now()),
                ),
                8.h.vSpace,
                LeftRightText(
                  textKey: 'Remaining Amount:',
                  textValue: '1000',
                ),
                8.h.vSpace,
                LeftRightText(
                  textKey: 'Payment terms:',
                  textValue: 'Due on receipt',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                          ),
                          context: context,
                          builder: (ctx) {
                            return const TakePaymentBottomSheet();
                          },
                        );
                      },
                      child: Text(
                        '+ Take Payment',
                        style: TextStyle(
                          color: AppColors.primaryBlue1,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Request Payment',
                        style: TextStyle(
                          color: AppColors.primaryBlue1,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class LeftRightText extends StatelessWidget {
  const LeftRightText({
    required this.textKey,
    required this.textValue,
    super.key,
  });
  final String textKey;
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textKey,
          style: TextStyle(
            color: AppColors.nutralBlack2,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          textValue,
          style: TextStyle(
            color: AppColors.nutralBlack2,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class InvoiceEmptyPaymentView extends StatelessWidget {
  const InvoiceEmptyPaymentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white1,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [
          Text(
            'Payments',
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                builder: (ctx) {
                  return const TakePaymentBottomSheet();
                },
              );
            },
            child: Text(
              'Take Payment',
              style: TextStyle(
                color: AppColors.primaryBlue1,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 3),
          TextButton(
            onPressed: () {},
            child: Text(
              'Request Payment',
              style: TextStyle(
                color: AppColors.primaryBlue1,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
