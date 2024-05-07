import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../utils/colors.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../utils/text_styles.dart';
import '../../../settings/widgets/text_card.dart';

class ViewInvoiceScreen extends StatefulWidget {
  const ViewInvoiceScreen({
    super.key,
  });

  @override
  State<ViewInvoiceScreen> createState() => _ViewInvoiceScreenState();
}

class _ViewInvoiceScreenState extends State<ViewInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.white1,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.nutralBlack1),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            "View Invoice",
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(Assets.images.png.bLogo.keyName),
                      RichText(
                        text: TextSpan(
                          text: 'Invoice ID ',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp, fontFamily: "Poppins", color: AppColors.nutralBlack2),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'AT352375124',
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp, fontFamily: "Poppins", color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Estimation',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: Colors.red,
                            fontFamily: "lato"
                                ""),
                      )
                    ],
                  )),
                  const TextCard(
                    buttonText: "Pending",
                    bgColor: AppColors.lightYellow2,
                    textColor: AppColors.darkYellow,
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Divider(
                thickness: 1.w,
                color: AppColors.greyStrokColor,
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r), color: AppColors.pink, boxShadow: [BoxShadow(offset: const Offset(0, 0), blurRadius: 4, color: Colors.black.withOpacity(.10))]),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Action Required", style: TextStyle(fontSize: 14.sp, color: AppColors.white1, fontWeight: FontWeight.w600, fontFamily: "Inter")),
                        Text("This estimation is pending for your approval.", style: TextStyle(fontSize: 12.sp, color: AppColors.white1, fontWeight: FontWeight.w400, fontFamily: "Inter")),
                      ],
                    )),
                    const SizedBox(
                      width: 50,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r), color: Colors.transparent, border: Border.all(color: Colors.white)),
                      child: Text(
                        "Accept Estimation",
                        style: TextStyle(fontSize: 14.sp, color: AppColors.white1, fontWeight: FontWeight.w400, fontFamily: "lato"),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hammer Comms LLC",
                          style: TextStyle(fontSize: 14.sp, color: AppColors.nutralBlack1, fontWeight: FontWeight.w600, fontFamily: "Poppins"),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Hammer Comms LLC",
                          style: TextStyle(fontSize: 12.sp, color: AppColors.nutralBlack2, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Arlington, VA 22203",
                          style: TextStyle(fontSize: 12.sp, color: AppColors.nutralBlack2, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "E: info@hammercomms.com",
                          style: TextStyle(fontSize: 12.sp, color: AppColors.nutralBlack2, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Work Order ',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp, fontFamily: "Poppins", color: AppColors.nutralBlack2),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'WOAT351',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.sp, fontFamily: "Poppins", color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Billing Address",
                        style: TextStyle(fontSize: 12.sp, color: AppColors.nutralBlack2, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                      ),
                      Text(
                        "Contractor",
                        style: TextStyle(fontSize: 12.sp, color: AppColors.primaryBlue1, fontWeight: FontWeight.w500, fontFamily: "Poppins"),
                      ),
                      Text(
                        "12 Lafayette , NY 10562",
                        style: TextStyle(fontSize: 12.sp, color: AppColors.nutralBlack2, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        textDirection: TextDirection.ltr,
                        children: [
                          TableRow(children: [
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              color: AppColors.white3,
                              child: Text(
                                "Due On",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              color: AppColors.white3,
                              child: Text(
                                "Due on receipt",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "Next Payment Amount",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: AppColors.nutralBlack2, fontFamily: 'Poppins'),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                r"$5.00",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: AppColors.nutralBlack2, fontFamily: 'Poppins'),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              color: AppColors.white3,
                              child: Text(
                                "Expiration Period",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              color: AppColors.white3,
                              child: Text(
                                "10 Days",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "Expires On",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: AppColors.nutralBlack2, fontFamily: 'Poppins'),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "Expires On",
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: AppColors.nutralBlack2, fontFamily: 'Poppins'),
                              ),
                            ),
                          ]),
                        ],
                      )
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(4.r), topLeft: Radius.circular(4.r))),
                child: Table(
                  textDirection: TextDirection.ltr,
                  columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(4), 2: FlexColumnWidth(), 3: FlexColumnWidth(), 4: FlexColumnWidth(2)},
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(children: [
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.r), // Adjust border radius as needed
                          ),
                          color: AppColors.purple2,
                        ),
                        child: Text(
                          "Date",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white1,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: const BoxDecoration(
                          color: AppColors.purple2,
                        ),
                        child: Text(
                          "Item",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white1,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: const BoxDecoration(
                          color: AppColors.purple2,
                        ),
                        child: Text(
                          "Qty",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white1,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: const BoxDecoration(
                          color: AppColors.purple2,
                        ),
                        child: Text(
                          "Unit",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white1,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(4.r), // Adjust border radius as needed
                          ),
                          color: AppColors.purple2,
                        ),
                        child: Text(
                          "Amount",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white1,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Container(
                        height: 60.h, // Set a fixed height for the cell

                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(width: 1.5, color: AppColors.white2),
                            bottom: BorderSide(width: 1.5, color: AppColors.white2),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Invalid date",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        height: 60.h, // Set a fixed height for the cell

                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(width: 1.5, color: AppColors.white2),
                            bottom: BorderSide(width: 1.5, color: AppColors.white2),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bed bug extermination",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                            ),
                            Text(
                              "Pest Control > Bed Bug Extermination",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400, color: AppColors.nutralBlack2, fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        height: 60.h, // Set a fixed height for the cell

                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(width: 1.5, color: AppColors.white2),
                            bottom: BorderSide(width: 1.5, color: AppColors.white2),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "1",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        height: 60.h, // Set a fixed height for the cell

                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(width: 1.5, color: AppColors.white2),
                            bottom: BorderSide(width: 1.5, color: AppColors.white2),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            r"$50",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        height: 60.h, // Set a fixed height for the cell

                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(width: 1.5, color: AppColors.white2),
                            bottom: BorderSide(width: 1.5, color: AppColors.white2),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            r"$50.00",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                    ])
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    const SizedBox(
                      width: 30,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      color: AppColors.white1,
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "Subtotal",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.nutralBlack2, fontFamily: 'Poppins'),
                      ),
                    ),
                    Container(
                      color: AppColors.white1,
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        r"$50.00",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    const SizedBox(
                      width: 30,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      color: AppColors.white1,
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "Discount ",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.nutralBlack2, fontFamily: 'Poppins'),
                      ),
                    ),
                    Container(
                      color: AppColors.white1,
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        r"0.00",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    const SizedBox(
                      width: 30,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.5, color: AppColors.white2),
                        ),
                        color: AppColors.white1,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "Taxable ",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.nutralBlack2, fontFamily: 'Poppins'),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.5, color: AppColors.white2),
                        ),
                        color: AppColors.white1,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        r"0.00",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    const SizedBox(
                      width: 30,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.white1,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "Total ",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.white1,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        r"$50.00",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    const SizedBox(
                      width: 30,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      color: AppColors.white1,
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "Paid ",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.nutralBlack2, fontFamily: 'Poppins'),
                      ),
                    ),
                    Container(
                      color: AppColors.white1,
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        r"0.00",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    const SizedBox(
                      width: 30,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.white1,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "Minimum Payment ",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.white1,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        r"$5.00",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: AppColors.nutralBlack1, fontFamily: 'Poppins'),
                      ),
                    ),
                  ]),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Cancellation",
                style: TextStyle(fontSize: 14.sp, color: AppColors.nutralBlack1, fontWeight: FontWeight.w600, fontFamily: "Poppins"),
              ),
              Text(
                r"$5.00 cancellation fee might be applied if cancelled after activation.",
                style: TextStyle(fontSize: 10.sp, color: AppColors.nutralBlack2, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Deposit to A/R",
                style: TextStyle(fontSize: 14.sp, color: AppColors.primaryBlue1, fontWeight: FontWeight.w600, fontFamily: "Poppins"),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Jhon Williamson",
                      style: TextStyle(fontSize: 14.sp, color: AppColors.nutralBlack1, fontWeight: FontWeight.w600, fontFamily: "Poppins"),
                    ),
                  ),
                  Text(
                    r"$40.00",
                    style: TextStyle(fontSize: 14.sp, color: AppColors.nutralBlack1, fontWeight: FontWeight.w600, fontFamily: "Poppins"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Payment via:Bank",
                    style: TextStyle(fontSize: 14.sp, color: AppColors.nutralBlack2, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Date: 18 Dec, 2023",
                      style: TextStyle(fontSize: 14.sp, color: AppColors.nutralBlack2, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
                    ),
                  ),
                  const TextCard(
                    buttonText: "Paid",
                    bgColor: AppColors.green4,
                    textColor: AppColors.greendark,
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Note  ",
                style: TextStyle(fontSize: 14.sp, color: AppColors.nutralBlack1, fontWeight: FontWeight.w600, fontFamily: "Poppins"),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "In today's interconnected world, teams have become the backbone of successful organi zations. However, the effectiveness of a team heavily relies on various factors  ",
                style: TextStyle(fontSize: 12.sp, color: AppColors.nutralBlack2, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Terms & conditions  ",
                style: TextStyle(fontSize: 14.sp, color: AppColors.nutralBlack1, fontWeight: FontWeight.w600, fontFamily: "Poppins"),
              ),
              Text(
                "1. Please pay within 10 days",
                style: TextStyle(fontSize: 12.sp, color: AppColors.nutralBlack2, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
              ),
              Text(
                "2. Please pay within 10 days",
                style: TextStyle(fontSize: 12.sp, color: AppColors.nutralBlack2, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
              ),
              Text(
                "3. Please pay within 10 days",
                style: TextStyle(fontSize: 12.sp, color: AppColors.nutralBlack2, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Activity Logs ",
                style: TextStyle(fontSize: 14.sp, color: AppColors.nutralBlack1, fontWeight: FontWeight.w600, fontFamily: "Poppins"),
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
                endChild: const Padding(padding: EdgeInsets.all(8.0), child: ActivityLogCard()),
              ),
              TimelineTile(
                alignment: TimelineAlign.start,
                lineXY: 0.3,
                indicatorStyle: const IndicatorStyle(
                  color: AppColors.primaryBlue1,
                ),
                beforeLineStyle: const LineStyle(color: AppColors.primaryBlue1),
                afterLineStyle: const LineStyle(color: AppColors.primaryBlue1),
                endChild: const Padding(padding: EdgeInsets.all(8.0), child: ActivityLogCard()),
              ),
              TimelineTile(
                alignment: TimelineAlign.start,
                lineXY: 0.3,
                indicatorStyle: const IndicatorStyle(
                  color: AppColors.primaryBlue1,
                ),
                beforeLineStyle: const LineStyle(color: AppColors.primaryBlue1),
                afterLineStyle: const LineStyle(color: AppColors.primaryBlue1),
                endChild: const Padding(padding: EdgeInsets.all(8.0), child: ActivityLogCard()),
              ),
              TimelineTile(
                alignment: TimelineAlign.start,
                lineXY: 0.3,
                indicatorStyle: const IndicatorStyle(
                  color: AppColors.greyStrokColor,
                ),
                beforeLineStyle: const LineStyle(color: AppColors.primaryBlue1),
                afterLineStyle: const LineStyle(color: AppColors.greyStrokColor),
                endChild: const Padding(padding: EdgeInsets.all(8.0), child: ActivityLogCard()),
              ),
              TimelineTile(
                alignment: TimelineAlign.start,
                lineXY: 0.3,
                indicatorStyle: const IndicatorStyle(
                  color: AppColors.greyStrokColor,
                ),
                beforeLineStyle: const LineStyle(color: AppColors.greyStrokColor),
                afterLineStyle: const LineStyle(color: AppColors.greyStrokColor),
                endChild: const Padding(padding: EdgeInsets.all(8.0), child: ActivityLogCard()),
              ),
              SizedBox(
                height: 32.h,
              ),
            ],
          ),
        ));
  }
}

class ActivityLogCard extends StatelessWidget {
  const ActivityLogCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(border: Border.all(color: AppColors.greyStrokColor), color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jhon Williamson',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyle.commonBold,
              ),
            ],
          ),
          Text(
            r"Payment: $40.00",
            style: TextStyle(fontSize: 12.sp, color: AppColors.nutralBlack2, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
          ),
          Text(
            "Payment via: Bank",
            style: TextStyle(fontSize: 12.sp, color: AppColors.nutralBlack2, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
          ),
          Text(
            "18 Dec, 2023 - 08:30 PM",
            style: TextStyle(fontSize: 12.sp, color: AppColors.nutralBlack2, fontWeight: FontWeight.w400, fontFamily: "Poppins"),
          ),
        ],
      ),
    );
  }
}
