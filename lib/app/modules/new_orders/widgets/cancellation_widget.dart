import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/controllers/invoice_controller.dart';
import 'package:nuforce/app/shared/widgets/text_with_bottom_border.dart';
import 'package:nuforce/app/utils/colors.dart';

class CancellationWidget extends StatefulWidget {
  const CancellationWidget({
    super.key,
  });

  @override
  State<CancellationWidget> createState() => _CancellationWidgetState();
}

class _CancellationWidgetState extends State<CancellationWidget> {
  final cancellationController = TextEditingController();

  @override
  void dispose() {
    cancellationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CANCELLATION',
          style: TextStyle(
            color: AppColors.nutralBlack1,
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        GetBuilder<InvoiceController>(
          builder: (controller) {
            return TextWithBottomBorder(
              hint: controller.cancellationNote ?? '',
              type: CustomType.dateTime,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomDialogWithTextField(
                      controller: cancellationController..text = controller.cancellationNote ?? '',
                      hint: 'Cancellation Note',
                      onPrimaryButtonPressed: () {
                        controller.updateCancellationNote(cancellationController.text);
                        Get.back();
                      },
                      onSecondaryButtonPressed: () {
                        Get.back();
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
