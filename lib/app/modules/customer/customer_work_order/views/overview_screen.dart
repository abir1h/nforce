import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../service_center/sub_modules/work_order_view/sub_modules/over_view/views/edit_work_order.dart';
import 'work_order_details_view.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../../../../utils/app_sizes.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/datetime_custom_func.dart';
import '../providers/work_order_provider.dart';

class OverViewScreen extends StatefulWidget {
  const OverViewScreen({
    required this.order,
    super.key,
  });
  final MockWorkOrderModel order;
  @override
  State<OverViewScreen> createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.tabbarColor,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.images.svg.documentFilled,
                  height: 30.h,
                  width: 30.w,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'File ',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            fontFamily: "Poppins",
                            color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: '(No file upload yet)',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                fontFamily: "Poppins",
                                color: AppColors.nutralBlack2),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.primaryBlue1,
                      ),
                      child: Text(
                        "Upload File",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontFamily: "Poppins"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Additional Details",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    fontFamily: "poppins",
                    color: AppColors.nutralBlack1),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: AppColors.tabbarColor,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.images.svg.editRounded,
                      height: 40,
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: AppColors.primaryBlue1),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'Payment Details',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColors.nutralBlack2),
          ),
          Text(
            'First Responder',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColors.nutralBlack2),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            "Additional Details",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                fontFamily: "poppins",
                color: AppColors.nutralBlack1),
          ),
          SizedBox(
            height: 16.h,
          ),
          TimelineTile(
            isFirst: true,
            alignment: TimelineAlign.start,
            indicatorStyle: const IndicatorStyle(
              color: AppColors.primaryBlue1,
            ),
            beforeLineStyle: const LineStyle(color: AppColors.primaryBlue1),
            afterLineStyle: const LineStyle(color: AppColors.primaryBlue1),
            endChild: const Padding(
                padding: EdgeInsets.all(8.0), child: TimeLineCard()),
          ),
          TimelineTile(
            alignment: TimelineAlign.start,
            lineXY: 0.3,
            indicatorStyle: const IndicatorStyle(
              color: AppColors.primaryBlue1,
            ),
            beforeLineStyle: const LineStyle(color: AppColors.primaryBlue1),
            afterLineStyle: const LineStyle(color: AppColors.primaryBlue1),
            endChild: const Padding(
                padding: EdgeInsets.all(8.0), child: TimeLineCard()),
          ),
          TimelineTile(
            alignment: TimelineAlign.start,
            lineXY: 0.3,
            indicatorStyle: const IndicatorStyle(
              color: AppColors.primaryBlue1,
            ),
            beforeLineStyle: const LineStyle(color: AppColors.primaryBlue1),
            afterLineStyle: const LineStyle(color: AppColors.primaryBlue1),
            endChild: const Padding(
                padding: EdgeInsets.all(8.0), child: TimeLineCard()),
          ),
          TimelineTile(
            alignment: TimelineAlign.start,
            lineXY: 0.3,
            indicatorStyle: const IndicatorStyle(
              color: AppColors.greyStrokColor,
            ),
            beforeLineStyle: const LineStyle(color: AppColors.primaryBlue1),
            afterLineStyle: const LineStyle(color: AppColors.greyStrokColor),
            endChild: const Padding(
                padding: EdgeInsets.all(8.0), child: TimeLineCard()),
          ),
          TimelineTile(
            alignment: TimelineAlign.start,
            lineXY: 0.3,
            indicatorStyle: const IndicatorStyle(
              color: AppColors.greyStrokColor,
            ),
            beforeLineStyle: const LineStyle(color: AppColors.greyStrokColor),
            afterLineStyle: const LineStyle(color: AppColors.greyStrokColor),
            endChild: const Padding(
                padding: EdgeInsets.all(8.0), child: TimeLineCard()),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
