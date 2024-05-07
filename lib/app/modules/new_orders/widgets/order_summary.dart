import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/controllers/invoice_controller.dart';
import 'package:nuforce/app/shared/widgets/text_with_bottom_border.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/datetime_custom_func.dart';
import 'package:nuforce/main.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({
    super.key,
  });

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  final TextEditingController dueAmountController = TextEditingController();

  @override
  void dispose() {
    dueAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GetBuilder<InvoiceController>(
        builder: (controller) {
          final invoice = controller.invoice;
          return Table(
            children: [
              TableRow(
                children: [
                  Text(
                    'Work Order:',
                    style: _localLabelStyle(),
                  ),
                  Text(
                    invoice?.params?.workorderNo ?? '-',
                    style: _localValueStyle(),
                  ),
                  // const Spacer(),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    'Due Amount:',
                    style: _localLabelStyle(),
                  ),
                  TextWithBottomBorder(
                    hint: '\$${invoice?.amountDue ?? 0}',
                    type: CustomType.text,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialogWithTextField(
                            controller: dueAmountController,
                            keyboardType: TextInputType.number,
                            hint: 'Enter Due Amount',
                            onPrimaryButtonPressed: () {},
                            onSecondaryButtonPressed: () {},
                          );
                        },
                      );
                    },
                  ),
                  // const Spacer(),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    'Inv Date:',
                    style: _localLabelStyle(),
                  ),
                  GetBuilder<InvoiceController>(
                    builder: (controller) {
                      return TextWithBottomBorder(
                        hint: DatetimeCustomFunc.getFormattedDate(invoice?.createdAt),
                        type: CustomType.dateTime,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(const Duration(days: 365)),
                          ).then(
                            (value) {
                              // controller.updateInvDate(value);
                              controller.updateInvoice(
                                invoice!.copyWith(
                                  createdAt: value,
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                  // const Spacer(),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    'Expires On:',
                    style: _localLabelStyle(),
                  ),
                  TextWithBottomBorder(
                    hint: invoice?.expiresOn != null ? DatetimeCustomFunc.getFormattedDate(invoice?.expiresOn) : 'Select Expire Date',
                    type: CustomType.dateTime,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      ).then((value) {
                        controller.updateExpireDate(value);
                      });
                    },
                  )
                  // const Spacer(),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

TextStyle _localValueStyle() {
  return TextStyle(
    color: AppColors.nutralBlack1,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
}

TextStyle _localLabelStyle() {
  return TextStyle(
    color: AppColors.nutralBlack2,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
}
