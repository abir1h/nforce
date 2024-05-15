import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:nuforce/app/modules/new_orders/models/activity_log_model.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../shared/widgets/details_with_header_skleton.dart';
import '../controllers/invoice_controller.dart';

class ActivityLogView extends StatefulWidget {
  const ActivityLogView({
    super.key,
  });

  @override
  State<ActivityLogView> createState() => _ActivityLogViewState();
}

class _ActivityLogViewState extends State<ActivityLogView> {
  @override
  void initState() {
    super.initState();
    activityExpandableController.addListener(() {
      if (activityExpandableController.expanded) {
        setState(() {
          isActivityLogExpanded = true;
        });
      } else {
        setState(() {
          isActivityLogExpanded = false;
        });
      }
    });
  }

  final activityExpandableController = ExpandableController();
  bool isActivityLogExpanded = false;
  @override
  Widget build(BuildContext context) {
    return DetailsWithHeaderSkleton(
      controller: ExpandableController(),
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Activity log',
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(isActivityLogExpanded
              ? Icons.keyboard_arrow_up
              : Icons.keyboard_arrow_down),
        ],
      ),
      body: GetBuilder<InvoiceController>(
        builder: (controller) {
          return ListView.separated(
            itemCount: controller.activityLogList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return TimelineTile(
                isFirst: index == 0 ? true : false,
                alignment: TimelineAlign.start,
                indicatorStyle:
                    const IndicatorStyle(color: AppColors.primaryBlue1),
                beforeLineStyle: const LineStyle(
                  color: AppColors.greyStrokColor,
                ),
                afterLineStyle:
                    const LineStyle(color: AppColors.greyStrokColor),
                endChild: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ActivityLogItemWidget(
                      data: controller.activityLogList[index]),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
          );
        },
      ),
    );
  }
}

class ActivityLogItemWidget extends StatelessWidget {
  final ActivityListData data;
  const ActivityLogItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(left: 14, top: 10, right: 14, bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.white1,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.white2,
              blurRadius: 10.r,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.description,
              style: TextStyle(
                color: AppColors.nutralBlack2,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              DateFormat.yMMMMd('en_US').add_jm().format(data.logAt),
              style: TextStyle(
                color: AppColors.nutralBlack2,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ));
  }
}
