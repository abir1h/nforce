import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/providers/work_order_provider.dart';
import 'package:nuforce/app/modules/customer/widgets/work_order_mini_tabs.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/datetime_custom_func.dart';
import 'package:nuforce/app/utils/extension_methods.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          const SizedBox(height: 10),
          const WorkOrderMinMiniTabs(),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: Column(
                children: [
                  OverviewItem(
                    title: 'Start Date',
                    value: DatetimeCustomFunc.getFormattedDate(widget.order.startDate),
                  ),
                  const SizedBox(height: 16),
                  OverviewItem(
                    title: 'Status',
                    value: widget.order.status.name.toTitleCase(),
                  ),
                  const SizedBox(height: 16),
                  OverviewItem(
                    title: 'Contact',
                    value: widget.order.contactName,
                  ),
                  const SizedBox(height: 16),
                  OverviewItem(
                    title: 'Work Order No',
                    alternativeValue: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: AppColors.lightblue,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Text(
                        widget.order.uuid.generate().split('-').first,
                        style: TextStyle(
                          color: AppColors.primaryBlue1,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  OverviewItem(
                    title: 'Work Order Type',
                    value: widget.order.orderType,
                    isValueBold: false,
                  ),
                  const SizedBox(height: 16),
                  OverviewItem(
                    title: 'Service Package',
                    value: widget.order.servicePackage,
                    isValueBold: false,
                  ),
                  const SizedBox(height: 16),
                  OverviewItem(
                    title: 'Priority',
                    alternativeValue: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: AppColors.lightYellow,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Text(
                        widget.order.priority.name,
                        style: TextStyle(
                          color: AppColors.deepYellow,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  OverviewItem(
                    title: 'Zipcode',
                    value: widget.order.zipCode,
                    isValueBold: false,
                  ),
                  const SizedBox(height: 16),
                  OverviewItem(
                    title: 'Tax',
                    value: widget.order.tax ?? 'N/A',
                    isValueBold: false,
                  ),
                  const SizedBox(height: 16),
                  OverviewItem(
                    title: 'Discount',
                    value: widget.order.discount ?? 'N/A',
                    isValueBold: false,
                  ),
                  const SizedBox(height: 16),
                  OverviewItem(
                    title: 'Cancellation Fee',
                    value: '${widget.order.cancellationFee}%',
                    isValueBold: false,
                  ),
                  const SizedBox(height: 16),
                  OverviewItem(
                    title: 'Partial Payment',
                    value: '${widget.order.partialPayment}%',
                    isValueBold: false,
                  ),
                  const SizedBox(height: 16),
                  OverviewItem(
                    title: 'Notes',
                    value: widget.order.notes ?? 'N/A',
                    isValueBold: false,
                  ),
                  const SizedBox(height: 16),
                  OverviewItem(
                    title: 'Created',
                    value: DatetimeCustomFunc.dateWithTime(widget.order.createdAt),
                    isValueBold: false,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
