import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/customer/customer_work_order/views/view_invoice_screen.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../../utils/text_styles.dart';
import '../../../service_center/sub_modules/estimation/views/estimation_view.dart';
import '../../../service_center/sub_modules/work_order_view/sub_modules/over_view/views/edit_work_order.dart';
import 'work_order_details_view.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../../../../utils/app_sizes.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/datetime_custom_func.dart';
import '../providers/work_order_provider.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({
    super.key,
  });
  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Invoices (20)", style: CustomTextStyle.commonBold),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 5.h),
                decoration: BoxDecoration(
                  color: AppColors.textFieldBackground,
                  borderRadius: BorderRadius.circular(4.r),

                ),child: Row(
                children: [
                  Text("All", style: CustomTextStyle.commonBold),
                  SizedBox(width: 40.w,),
                  Icon(Icons.keyboard_arrow_down_sharp)
                ],
              ),
              )
          ],), SizedBox(
            height: 16.h,
          ),
          const InvoiceCard(), SizedBox(
            height: 16.h,
          ),
          const InvoiceCard(), SizedBox(
            height: 16.h,
          ),
          const InvoiceCard(), SizedBox(
            height: 16.h,
          ),
          const InvoiceCard(), SizedBox(
            height: 16.h,
          ),
          const InvoiceCard(), SizedBox(
            height: 16.h,
          ),
          const InvoiceCard(), SizedBox(
            height: 16.h,
          ),
          const InvoiceCard(), SizedBox(
            height: 16.h,
          ),
          const InvoiceCard(),
          SizedBox(
            height: 20.h,
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
    return GestureDetector(
      onTap: ()=>Get.to(()=>const ViewInvoiceScreen()),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: Colors.white,border: Border.all(color: AppColors.greyStrokColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("INV AT352308105", style: CustomTextStyle.commonBold),
                Text(r"$500.00", style: CustomTextStyle.commonBold),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Due to: 27 Aug, 2023",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      fontFamily: "poppins",
                      color: AppColors.nutralBlack2),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 2.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.lightYellow2),
                  child: Text(
                    "pending",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      fontFamily: "Poppins",
                      color: AppColors.darkYellow,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 6.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.primaryBlue1),
                  child: Center(
                    child: Text(
                      "View invoice",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        fontFamily: "Poppins",
                        color: AppColors.white1,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
