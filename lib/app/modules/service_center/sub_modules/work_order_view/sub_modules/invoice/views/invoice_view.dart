import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/modules/service_center/sub_modules/estimation/views/estimation_view.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../../new_orders/controllers/invoice_controller.dart';



class InvoiceView extends GetView<InvoiceController> {
  const InvoiceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgWithOpacity,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Text(
                  "Invoice and Estimates",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "poppins",
                      color: AppColors.nutralBlack1),
                ),
              ),
              const EstimatioCard(),
              const EstimatioCard(),
              const EstimatioCard(),
              const EstimatioCard(),
              const EstimatioCard(),
              const EstimatioCard(),
              const EstimatioCard(),
              const EstimatioCard(),
              const EstimatioCard(),
              const EstimatioCard(),

            ],
          ),
        ));
  }
}

