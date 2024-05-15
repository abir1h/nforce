import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/new_orders/controllers/invoice_schedule_controller.dart';
import 'package:nuforce/app/modules/new_orders/widgets/empty_schedule_view.dart';
import 'package:nuforce/app/modules/new_orders/widgets/invoice_schedule_bottomsheet.dart';
import 'package:nuforce/app/shared/widgets/details_with_header_skleton.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/gen/assets.gen.dart';

class InvoiceScheduleView extends StatefulWidget {
  const InvoiceScheduleView({
    super.key,
    required this.workorderId,
  });
  final String workorderId;

  @override
  State<InvoiceScheduleView> createState() => _InvoiceScheduleViewState();
}

class _InvoiceScheduleViewState extends State<InvoiceScheduleView> {
  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<InvoiceScheduleController>() == false) {
      Get.put(InvoiceScheduleController()).getInvoiceSchedule(widget.workorderId);
    } else {
      Get.find<InvoiceScheduleController>();
    }
  }

  final expandableController = ExpandableController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceScheduleController>(
      builder: (controller) {
        if (controller.invoiceScheduleModel?.data?.isEmpty ?? true) {
          return const EmptyScheduleView();
        }
        return DetailsWithHeaderSkleton(
          controller: expandableController,
          header: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Schedule',
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          body: GetBuilder<InvoiceScheduleController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 56.h,
                        width: 56.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(Assets.images.png.profilePlaceholderMale.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      10.w.hSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'EB2323',
                            style: TextStyle(
                              color: AppColors.nutralBlack1,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '09-02-2024',
                            style: TextStyle(
                              color: AppColors.nutralBlack2,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '12:30 PM - 01:15 PM',
                            style: TextStyle(
                              color: AppColors.nutralBlack2,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  10.h.vSpace,
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        useSafeArea: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.r),
                            topRight: Radius.circular(24.r),
                          ),
                        ),
                        builder: (ctx) {
                          return const InvoiceScheduleSheet();
                        },
                      );
                    },
                    child: Text(
                      '+ Add Schedule',
                      style: TextStyle(
                        color: AppColors.primaryBlue1,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
