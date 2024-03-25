import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../controllers/over_view_controller.dart';
import '../widgets/stepper.dart';
import '../widgets/text_with_title.dart';
import '../widgets/text_with_widget.dart';
import 'edit_work_order.dart';

class OverView extends GetView<OverViewController> {
  const OverView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgWithOpacity,
        body: SingleChildScrollView(          physics: const BouncingScrollPhysics(),

          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              const TextWithTitle(
                firstItem: 'Start Date',
                secondItem: '25 Aut 2023',
              ),
              SizedBox(
                height: 16.h,
              ),
              const TextWithTitle(
                firstItem: 'Contact',
                secondItem: 'Eleanor Pena',
              ),
              SizedBox(
                height: 16.h,
              ),
              const TextWithTitle(
                firstItem: 'Address',
                secondItem: '7163 Us 98 Hwy E Fort Meade, Florida3652',
              ),
              SizedBox(
                height: 16.h,
              ),
              const TextWithTitle(
                firstItem: 'Agent Name',
                secondItem: 'Jerome Bell',
              ),
              SizedBox(
                height: 16.h,
              ),
              const TextWithTitle(
                firstItem: 'Status',
                secondItem: 'Pending',
              ),
              SizedBox(
                height: 16.h,
              ),
              const TextWithWidget(
                firstItem: 'Work Order No',
                secondItem: 'WOAT35134',
              ),
              SizedBox(
                height: 16.h,
              ),
              const TextWithTitle(
                firstItem: 'Work Order Type',
                secondItem: 'General',
              ),
              SizedBox(
                height: 16.h,
              ),
              const TextWithTitle(
                firstItem: 'Service Package',
                secondItem: 'Insect Removal',
              ),
              SizedBox(
                height: 16.h,
              ),
              Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(
                            milliseconds: 300), // Adjust the duration as needed
                        switchInCurve:
                            Curves.easeInOut, // Animation curve for appearing
                        switchOutCurve: Curves
                            .easeInOut, // Animation curve for disappearing
                        child: controller.isExpanded.value
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                key: const Key(
                                    'expanded'), // Key to differentiate between different children of AnimatedSwitcher
                                children: [
                                  const TextWithWidget(
                                    firstItem: 'Priority',
                                    secondItem: 'Medium',
                                    bgColor: AppColors.lightYellow2,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  const TextWithTitle(
                                    firstItem: 'Zipcode',
                                    secondItem: 'N/A',
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  const TextWithTitle(
                                    firstItem: 'Tax',
                                    secondItem: 'N/A',
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  const TextWithTitle(
                                    firstItem: 'Discount',
                                    secondItem: 'N/A',
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  const TextWithTitle(
                                    firstItem: 'Cancellation Fee',
                                    secondItem: '10%',
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  const TextWithTitle(
                                    firstItem: 'Partial Payment',
                                    secondItem: '10%',
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  const TextWithTitle(
                                    firstItem: 'Notes',
                                    secondItem: 'N/A',
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  const TextWithTitle(
                                    firstItem: 'Created',
                                    secondItem: 'August 27, 2023 10:38 AM by',
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Additonal Details",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.sp,
                                                fontFamily: "poppins",
                                                color: AppColors.nutralBlack1),
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Text(
                                            "Payment Details",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                                fontFamily: "poppins",
                                                color: AppColors.nutralBlack2),
                                          ),
                                          Text(
                                            " First Responder",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.sp,
                                                fontFamily: "poppins",
                                                color: AppColors.nutralBlack2),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: GestureDetector(
                                          onTap: (){
                                            Get.to<void>(() => const EditWorkOrder());

                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.w,
                                                vertical: 5.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                                color: AppColors.lightBlueBg),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    Assets.images.svg.edit),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  "Edit",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14.sp,
                                                    fontFamily: "Poppins",
                                                    color:
                                                        AppColors.primaryBlue1,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
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
                                    beforeLineStyle: const LineStyle(
                                        color: AppColors.primaryBlue1),
                                    afterLineStyle: const LineStyle(
                                        color: AppColors.primaryBlue1),
                                    endChild: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TimeLineCard()),
                                  ),
                                  TimelineTile(
                                    alignment: TimelineAlign.start,
                                    lineXY: 0.3,
                                    indicatorStyle: const IndicatorStyle(
                                      color: AppColors.primaryBlue1,
                                    ),
                                    beforeLineStyle: const LineStyle(
                                        color: AppColors.primaryBlue1),
                                    afterLineStyle: const LineStyle(
                                        color: AppColors.primaryBlue1),
                                    endChild: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TimeLineCard()),
                                  ),
                                  TimelineTile(
                                    alignment: TimelineAlign.start,
                                    lineXY: 0.3,
                                    indicatorStyle: const IndicatorStyle(
                                      color: AppColors.primaryBlue1,
                                    ),
                                    beforeLineStyle: const LineStyle(
                                        color: AppColors.primaryBlue1),
                                    afterLineStyle: const LineStyle(
                                        color: AppColors.primaryBlue1),
                                    endChild: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TimeLineCard()),
                                  ),
                                  TimelineTile(
                                    alignment: TimelineAlign.start,
                                    lineXY: 0.3,
                                    indicatorStyle: const IndicatorStyle(
                                      color: AppColors.greyStrokColor,
                                    ),
                                    beforeLineStyle: const LineStyle(
                                        color: AppColors.primaryBlue1),
                                    afterLineStyle: const LineStyle(
                                        color: AppColors.greyStrokColor),
                                    endChild: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TimeLineCard()),
                                  ),
                                  TimelineTile(
                                    alignment: TimelineAlign.start,
                                    lineXY: 0.3,
                                    indicatorStyle: const IndicatorStyle(
                                      color: AppColors.greyStrokColor,
                                    ),
                                    beforeLineStyle: const LineStyle(
                                        color: AppColors.greyStrokColor),
                                    afterLineStyle: const LineStyle(
                                        color: AppColors.greyStrokColor),
                                    endChild: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TimeLineCard()),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Invoice List",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp,
                                            fontFamily: "poppins",
                                            color: AppColors.nutralBlack1),
                                      ),
                                      Text(
                                        '+ Create Invoice',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                            color: AppColors.primaryBlue1),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  const InvoiceCard(),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  const InvoiceCard(),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  const InvoiceCard(),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  const InvoiceCard(),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  const InvoiceCard(),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                ],
                              )
                            : const SizedBox(), // Use SizedBox to make sure there's no visual artifact when the column is not expanded
                      ),
                      InkWell(
                        onTap: () {
                          controller.isExpanded.value =
                              !controller.isExpanded.value;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.isExpanded.value == false
                                  ? 'See More'
                                  : 'See Less',
                              style: TextStyle(
                                  color: AppColors.primaryBlue1,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  fontFamily: "Poppins"),
                            ),
                            AnimatedSwitcher(
                                duration: const Duration(
                                    milliseconds:
                                        300), // Adjust the duration as needed
                                switchInCurve: Curves
                                    .easeInOut, // Animation curve for appearing
                                switchOutCurve: Curves
                                    .easeInOut, // Animation curve for disappearing
                                child: controller.isExpanded.value
                                    ? const Icon(Icons.keyboard_arrow_up_sharp)
                                    : const Icon(
                                        Icons.keyboard_arrow_down_sharp))
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}

class TimeLineCard extends StatelessWidget {
  const TimeLineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      constraints: const BoxConstraints(
        minHeight: 120,
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Created work order WOAT351 for Aaron Taylor',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyle.commonBold,
          ),
          Text(
            'Dilruba Khanam Jesey',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyle.heading5
                .copyWith(color: AppColors.nutralBlack2, fontFamily: "Poppins"),
          ),
          Text(
            '25 Jan 2023 - 08:30PM',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyle.heading5
                .copyWith(color: AppColors.nutralBlack2, fontFamily: "Poppins"),
          ),
        ],
      ),
    );
  }
}

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'AT35- 2308105',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyle.commonBold,
              ),
              Text(
                r'$500.00',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyle.commonBold,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Due to: 27 Aug, 2023',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyle.heading5.copyWith(
                    color: AppColors.nutralBlack2, fontFamily: "Poppins"),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    color: AppColors.lightYellow2),
                child: Text(
                  "pending",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    fontFamily: "Poppins",
                    color: AppColors.darkYellow,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          SizedBox(
            height: 30.h,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.primaryBlue1),
                    child: Center(
                      child: Text(
                        "View Invoice",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          fontFamily: "Poppins",
                          color: AppColors.white1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: AppColors.primaryBlue1),
                        color: AppColors.white1),
                    child: Center(
                      child: Text(
                        "Customer Preview",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          fontFamily: "Poppins",
                          color: AppColors.primaryBlue1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
