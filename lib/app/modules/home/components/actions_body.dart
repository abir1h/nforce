import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/home/components/recommanded_actions_widget.dart';
import 'package:nuforce/app/modules/home/controllers/home_controller.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class ActionsBody extends GetView<HomeController> {
  const ActionsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today’s Activities',
                  style: TextStyle(
                    fontSize: isIpad ? 12.sp : 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.nutralBlack1,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    fontSize: isIpad ? 8.sp : 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.nutralBlack1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 3; i++) ...[
                    RecommandedActionsWidget(controller: controller),
                    SizedBox(width: 10.w),
                  ],
                ],
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
