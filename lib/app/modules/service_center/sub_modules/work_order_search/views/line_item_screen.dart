import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../widgets/service_centre_lineitem_card.dart';
import 'add_line_item.dart';

class LineItemScreen extends StatefulWidget {
  const LineItemScreen({super.key});

  @override
  State<LineItemScreen> createState() => _LineItemScreenState();
}

class _LineItemScreenState extends State<LineItemScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Line Item(20)",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp, fontFamily: "Poppins", color: AppColors.nutralBlack1),
              ),
              GestureDetector(
                onTap: () => Get.to(() => const AddLineItem()),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: AppColors.lightBlueBg,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.add,
                        size: 24.r,
                        color: AppColors.primaryBlue1,
                      ),
                      Text(
                        "Add New",
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp, fontFamily: "Poppins", color: AppColors.primaryBlue1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          ServiceCentreSearchCardLineItem(),
          SizedBox(
            height: 16.h,
          ),
          ServiceCentreSearchCardLineItem(),
          SizedBox(
            height: 16.h,
          ),
          ServiceCentreSearchCardLineItem(),
          SizedBox(
            height: 16.h,
          ),
          ServiceCentreSearchCardLineItem(),
          SizedBox(
            height: 16.h,
          ),
          ServiceCentreSearchCardLineItem(),
        ],
      ),
    );
  }
}
