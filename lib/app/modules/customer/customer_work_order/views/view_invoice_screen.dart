import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/providers/work_order_provider.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/views/invoice_screen.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/views/overview_screen.dart';
import 'package:nuforce/app/modules/customer/widgets/work_order_mini_tabs.dart';
import 'package:nuforce/app/utils/app_sizes.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/datetime_custom_func.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../../../settings/widgets/text_card.dart';
import '../controllers/customer_work_order_controller.dart';

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
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
          ],
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
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              fontFamily: "Poppins",
                              color: AppColors.nutralBlack2),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'AT352375124',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp,
                                  fontFamily: "Poppins",
                                  color: Colors.black),
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
                    borderRadius: BorderRadius.circular(4.r),
                    color: AppColors.pink,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(.10))
                    ]),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Action Required",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.white1,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter")),
                        Text("This estimation is pending for your approval.",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.white1,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter")),
                      ],
                    )),
                    const SizedBox(
                      width: 50,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white)),
                      child: Text(
                        "Accept Estimation",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.white1,
                            fontWeight: FontWeight.w400,
                            fontFamily: "lato"),
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
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.nutralBlack1,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins"),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Hammer Comms LLC",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.nutralBlack2,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins"),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "Arlington, VA 22203",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.nutralBlack2,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins"),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "E: info@hammercomms.com",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.nutralBlack2,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins"),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Work Order ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          fontFamily: "Poppins",
                          color: AppColors.nutralBlack2),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'WOAT351',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              fontFamily: "Poppins",
                              color: Colors.black),
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
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.nutralBlack2,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins"),
                      ),
                      Text(
                        "Contractor",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.primaryBlue1,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins"),
                      ),
                      Text(
                        "12 Lafayette , NY 10562",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.nutralBlack2,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins"),
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
                              padding: EdgeInsets.all(4.0),
                              color: AppColors.white3,
                              child: Text(
                                "Due On",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.nutralBlack1,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4.0),
                              color: AppColors.white3,
                              child: Text(
                                "Due on receipt",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.nutralBlack1,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Next Payment Amount",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.nutralBlack2,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                r"$5.00",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.nutralBlack2,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              padding: EdgeInsets.all(4.0),
                              color: AppColors.white3,
                              child: Text(
                                "Expiration Period",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.nutralBlack1,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4.0),
                              color: AppColors.white3,
                              child: Text(
                                "10 Days",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.nutralBlack1,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Expires On",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.nutralBlack2,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                "Expires On",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.nutralBlack2,
                                    fontFamily: 'Poppins'),
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
              SizedBox(
                height: 32.h,
              ),
            ],
          ),
        ));
  }
}
