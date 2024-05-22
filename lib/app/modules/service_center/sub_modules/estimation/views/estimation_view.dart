import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/extension_methods.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

import '../controllers/estimation_controller.dart';

class EstimationView extends GetView<EstimationController> {
  const EstimationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightShade,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
              decoration: const BoxDecoration(color: AppColors.white1),
              child: Row(
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Report',
                        style: CustomTextStyle.heading4.copyWith(
                          color: AppColors.nutralBlack1,
                          fontWeight: FontWeight.w600,
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: '(Dashboard & Colander )',
                            style: CustomTextStyle.heading4.copyWith(
                              color: AppColors.nutralBlack1,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Transform.scale(
                    scale: isIpad ? 1.5 : 1,
                    child: SvgPicture.asset(Assets.images.svg.calendarReport),
                  )
                ],
              ),
            ),
            SizedBox(height: 16.h),
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
            const EstimatioCard(),
            const EstimatioCard(),
            const EstimatioCard(),
            SizedBox(
              height: 32.h,
            ),
          ],
        ).ifIpad,
      ),
    );
  }
}

class EstimatioCard extends StatelessWidget {
  const EstimatioCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isIpad ? 0 : 16.w, vertical: 16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: Colors.white),
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
            Text(
              "Due to: 27 Aug, 2023",
              style: CustomTextStyle.heading5.copyWith(
                color: AppColors.nutralBlack2,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.primaryBlue1,
                  ),
                  child: Center(
                    child: Text(
                      "View Estimation",
                      style: CustomTextStyle.heading5.copyWith(
                        color: AppColors.white1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.lightYellow2,
                  ),
                  child: Text(
                    "pending",
                    style: CustomTextStyle.heading5.copyWith(
                      color: AppColors.darkYellow,
                      fontWeight: FontWeight.w400,
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
