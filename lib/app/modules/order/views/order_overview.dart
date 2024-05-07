import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/order/views/invoice_list.dart';
import 'package:nuforce/app/modules/order/views/order_additional_details.dart';
import 'package:nuforce/app/shared/widgets/edit_button.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderOverview extends StatefulWidget {
  const OrderOverview({
    super.key,
  });

  @override
  State<OrderOverview> createState() => _OrderOverviewState();
}

class _OrderOverviewState extends State<OrderOverview> {
  @override
  void initState() {
    super.initState();
    listenToExpandableController();
  }

  void listenToExpandableController() {
    expandableController.addListener(() {
      setState(() {
        isExpanded = expandableController.expanded;
      });
    });
  }

  final expandableController = ExpandableController(initialExpanded: false);
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _expandableSection(),
            24.h.vSpace,
            const InvoiceList(),
            24.h.vSpace,
          ],
        ),
      ),
    );
  }

  Widget _expandableSection() {
    return Column(
      children: [
        ExpandablePanel(
          controller: expandableController,
          theme: const ExpandableThemeData(
            hasIcon: false,
          ),
          header: IgnorePointer(
            ignoring: true,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _tableView(false),
            ),
          ),
          collapsed: const SizedBox(),
          expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _tableView(true),
              24.h.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Additional Details',
                    style: TextStyle(
                      color: AppColors.nutralBlack1,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  EditButton(onTap: () {}),
                ],
              ),
              12.h.vSpace,
              Text(
                'Payment Details\nFirst Responder',
                style: TextStyle(
                  color: AppColors.nutralBlack2,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              12.h.vSpace,
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return TimelineTile(
                    isFirst: index == 0,
                    alignment: TimelineAlign.start,
                    indicatorStyle: IndicatorStyle(
                      color: index <= 4 ? AppColors.primaryBlue1 : AppColors.greyStrokColor,
                    ),
                    beforeLineStyle: LineStyle(color: index <= 4 ? AppColors.primaryBlue1 : AppColors.greyStrokColor),
                    afterLineStyle: LineStyle(color: index < 4 ? AppColors.primaryBlue1 : AppColors.greyStrokColor),
                    endChild: Padding(
                      padding: EdgeInsets.only(left: 10, top: 16.h, bottom: index == 9 ? 16.h : 0),
                      child: const OrderAdditionDetailsTile(),
                    ),
                    isLast: index == 9,
                  );
                },
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            expandableController.toggle();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isExpanded ? 'Show less' : 'Show more',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryBlue1,
                  ),
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: AppColors.primaryBlue1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Table _tableView(bool showFull) {
    return Table(
      children: [
        if (!showFull) ...[
          _row(title: 'Start Date', value: '25 Aut 2023'),
          _row(title: 'Contact', value: 'Eleanor Pena'),
          _row(title: 'Address', value: '7163 Us 98 Hwy E Fort Meade, Florida3652'),
          _row(title: 'Agent Name', value: 'Jerome Bell'),
          _row(title: 'Status', value: 'Pending'),
          _row(
            title: 'Work Order No',
            value: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue1.withOpacity(0.1),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Text(
                'WOAT351',
                style: TextStyle(
                  color: AppColors.primaryBlue1,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          _row(title: 'Work Order Type', value: 'General'),
          _row(title: 'Service Package', value: 'Insect Removal'),
        ],
        if (showFull) ...[
          _row(
            title: 'Priority',
            value: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.yellow.withOpacity(0.1),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Text(
                'WOAT351',
                style: TextStyle(
                  color: AppColors.yellow,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          _row(title: 'Zipcode', value: '10562'),
          _row(title: 'Tax', value: 'N/A'),
          _row(title: 'Discount', value: 'N/A'),
          _row(title: 'Cancellation Fee', value: '10%'),
          _row(title: 'Partial Payment', value: '10%'),
          _row(title: 'Notes', value: 'N/A'),
          _row(title: 'Created', value: 'August 27, 2023 10:38 AM'),
        ],
      ],
    );
  }

  TableRow _row({required String title, required dynamic value}) {
    bool isValueString = false;
    if (value is String) {
      isValueString = true;
    } else if (value is Widget) {
      isValueString = false;
    } else {
      throw ArgumentError('"value" must be either String or Widget');
    }
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.nutralBlack2,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: isValueString
              ? Text(
                  ': $value',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              : Row(
                  children: [
                    Text(
                      ': ',
                      style: TextStyle(
                        color: AppColors.nutralBlack1,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    value,
                  ],
                ),
        ),
      ],
    );
  }
}
