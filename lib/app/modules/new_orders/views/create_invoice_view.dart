import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/controllers/invoice_controller.dart';
import 'package:nuforce/app/modules/new_orders/widgets/agents_widget.dart';
import 'package:nuforce/app/modules/new_orders/widgets/cancellation_widget.dart';
import 'package:nuforce/app/modules/new_orders/widgets/empty_activity_log_view.dart';
import 'package:nuforce/app/modules/new_orders/widgets/empty_expense_view.dart';
import 'package:nuforce/app/modules/new_orders/widgets/empty_note_view.dart';
import 'package:nuforce/app/modules/new_orders/widgets/invoice_payment_section.dart';
import 'package:nuforce/app/modules/new_orders/widgets/empty_schedule_view.dart';
import 'package:nuforce/app/modules/new_orders/widgets/empty_terms_view.dart';
import 'package:nuforce/app/modules/new_orders/widgets/invoice_attachments.dart';
import 'package:nuforce/app/modules/new_orders/widgets/invoice_contact_view.dart';
import 'package:nuforce/app/modules/new_orders/widgets/invoice_line_items_widget.dart';
import 'package:nuforce/app/modules/new_orders/widgets/order_summary.dart';
import 'package:nuforce/app/shared/widgets/colored_button.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/shared/widgets/text_with_bottom_border.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/app/utils/global_states.dart';
import 'package:nuforce/gen/assets.gen.dart';

class CreateInvoiceView extends StatefulWidget {
  const CreateInvoiceView({super.key});

  @override
  State<CreateInvoiceView> createState() => _CreateInvoiceViewState();
}

class _CreateInvoiceViewState extends State<CreateInvoiceView> {
  @override
  void initState() {
    super.initState();
    Get.put(InvoiceController());
  }

  @override
  void dispose() {
    Get.delete<InvoiceController>();
    super.dispose();
  }

  final appState = Get.find<AppState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWithOpacity,
      appBar: CustomAppbarMinimal(
        title: 'Invoice #0022',
        trailing: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.h.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _profileImagePicker(),
                  const Agents(),
                ],
              ),
              18.h.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWithBottomBorder(
                        hint: 'Invoice ID: AT352375124',
                        type: CustomType.text,
                      ),
                      8.h.vSpace,
                      const TextWithBottomBorder(
                        hint: 'Estimation',
                        textColor: AppColors.red,
                        type: CustomType.text,
                      ),
                    ],
                  ),
                  ColoredButton(
                    text: 'Pending',
                    textColor: AppColors.yellow,
                    onTap: () {},
                  ),
                ],
              ),
              16.h.vSpace,
              const OrderSummary(),
              16.h.vSpace,
              const InvoiceContactView(),
              16.h.vSpace,
              const InvoiceAttachments(),
              16.h.vSpace,
              const InvoiceLineItemsWidget(),
              16.h.vSpace,
              const CancellationWidget(),
              16.h.vSpace,
              const InvoicePaymentSection(),
              16.h.vSpace,
              const EmptyExpense(),
              16.h.vSpace,
              const EmptyScheduleView(),
              16.h.vSpace,
              const EmptyNoteView(),
              16.h.vSpace,
              const EmptyTermsView(),
              16.h.vSpace,
              const EmptyActivityLogView(),
              24.h.vSpace,
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {},
                      text: 'Preview',
                      isOutlined: true,
                    ),
                  ),
                  10.w.hSpace,
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {},
                      text: 'Save & Send',
                    ),
                  ),
                ],
              ),
              60.h.vSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileImagePicker() {
    return Stack(
      children: [
        GetBuilder<InvoiceController>(
          builder: (controller) {
            return GestureDetector(
              onTap: () {
                controller.setImage();
              },
              child: Container(
                height: 74.w,
                width: 74.w,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blueLight),
                  shape: BoxShape.circle,
                  color: AppColors.white1,
                  image: controller.image != null
                      ? DecorationImage(
                          image: FileImage(File(controller.image!.path)),
                        )
                      : DecorationImage(image: NetworkImage(appState.user?.photoUrl ?? '')),
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SvgPicture.asset(Assets.images.svg.editRounded),
        )
      ],
    );
  }
}
