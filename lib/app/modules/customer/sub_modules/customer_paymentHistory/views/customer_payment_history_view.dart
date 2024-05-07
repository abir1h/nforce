import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/widgets/expanded_list.dart';

import '../../../../../shared/widgets/custom_appbar_minimal.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/text_styles.dart';
import '../controllers/customer_payment_history_controller.dart';

class CustomerPaymentHistoryView
    extends GetView<CustomerPaymentHistoryController> {
  const CustomerPaymentHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarMinimal(
        title: 'Payment History',
        centerTitle: true,
        trailing: [],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        physics: BouncingScrollPhysics(),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return const PayentHistoryCard(
              accountId: 'AC123456',
              status: 'Approved',
              ammount: 50000,
              invoiceId: 'INV12S54S5F4F2541',
              method: "Stripe",
              payer: "Jack Landee",
              ref: 'ch_1casdasjdbfdfshds',
            );
          },
          separatorBuilder: (_, index) {
            return SizedBox(
              height: 16.h,
            );
          },
          itemCount: 10,
          shrinkWrap: true,
        ),
      ),
    );
  }
}

class PayentHistoryCard extends StatelessWidget {
  final String accountId, invoiceId, status, ref, payer, method;
  final int ammount;
  const PayentHistoryCard(
      {super.key,
      required this.accountId,
      required this.invoiceId,
      required this.status,
      required this.ref,
      required this.payer,
      required this.method,
      required this.ammount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.white2),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(accountId, style: CustomTextStyle.commonBold),
              Text('\$$ammount', style: CustomTextStyle.commonBold),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  invoiceId,
                  style: CustomTextStyle.commonLabel,
                ),
              ),
              Container(
                height: 34,
                width: 76,
                decoration: BoxDecoration(
                  color: AppColors.green4,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    status,
                    style: CustomTextStyle.heading5.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ref',
                      overflow: TextOverflow.ellipsis,
                      style:
                          CustomTextStyle.commonLabel.copyWith(fontSize: 12.sp),
                    ),
                    Text(
                      ref,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyle.commonLabel.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 28.w,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payer',
                      overflow: TextOverflow.ellipsis,
                      style:
                          CustomTextStyle.commonLabel.copyWith(fontSize: 12.sp),
                    ),
                    Text(
                      payer,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyle.commonLabel.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 28.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Method',
                    overflow: TextOverflow.ellipsis,
                    style:
                        CustomTextStyle.commonLabel.copyWith(fontSize: 12.sp),
                  ),
                  Text(
                    method,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyle.commonLabel.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
