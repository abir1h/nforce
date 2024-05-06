import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/providers/work_order_provider.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/views/invoice_screen.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/views/overview_screen.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/views/policy_screen.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/views/schedule_screen.dart';
import 'package:nuforce/app/modules/customer/widgets/work_order_mini_tabs.dart';
import 'package:nuforce/app/utils/colors.dart';
import '../controllers/customer_work_order_controller.dart';
import 'location_screen.dart';

class WorkOrderDetailsView extends StatefulWidget {
  const WorkOrderDetailsView({
    required this.order,
    super.key,
  });
  final MockWorkOrderModel order;

  @override
  State<WorkOrderDetailsView> createState() => _WorkOrderDetailsViewState();
}

class _WorkOrderDetailsViewState extends State<WorkOrderDetailsView> {
  final Controller = Get.put(CustomerWorkOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: AppColors.white1,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.nutralBlack1),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.order.contactName,
                style: TextStyle(
                  color: AppColors.nutralBlack1,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                widget.order.startDate.toString(),
                style: TextStyle(
                  color: AppColors.subText,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        body: GetBuilder<CustomerWorkOrderController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const WorkOrderMinMiniTabs(),
                  const SizedBox(height: 20),
                  controller.tabEnum == WorkOrderTabEnum.overview
                      ? OverViewScreen(order: widget.order)
                      : controller.tabEnum == WorkOrderTabEnum.invoices
                          ? const InvoiceScreen()
                          : controller.tabEnum == WorkOrderTabEnum.schedules
                              ? const ScheduleScreen()
                              : controller.tabEnum == WorkOrderTabEnum.locations
                                  ? const LocationScreen()
                                  : controller.tabEnum == WorkOrderTabEnum.policies
                                      ? const PolicySscreen()
                                      : Container()
                ],
              ),
            );
          },
        ));
  }
}

class OverviewItem extends StatelessWidget {
  const OverviewItem({
    required this.title,
    this.value,
    this.isValueBold = true,
    this.alternativeValue,
    super.key,
  });
  final String title;
  final String? value;
  final bool isValueBold;
  final Widget? alternativeValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 134.w,
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.subText,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Text(
          ':',
          style: TextStyle(
            color: AppColors.subText,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 8),
        if (value != null)
          Expanded(
            child: Text(
              value!,
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontSize: 14.sp,
                fontWeight: isValueBold ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          )
        else if (alternativeValue != null)
          alternativeValue!,
      ],
    );
  }
}
