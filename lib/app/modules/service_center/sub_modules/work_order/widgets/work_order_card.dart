import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/main.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../settings/widgets/text_card.dart';

class WorkOrderCard extends StatelessWidget {
  final VoidCallback? onPressed;

  const WorkOrderCard({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isIpad ? 0 : 20.w, vertical: 16.h),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: AppColors.white1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Aaron Taylor",
                      style: CustomTextStyle.heading4.copyWith(
                        color: AppColors.nutralBlack1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const TextCard(
                    buttonText: "Pending",
                    bgColor: AppColors.lightYellow2,
                    textColor: AppColors.darkYellow,
                  )
                ],
              ),
              SizedBox(
                height: 6.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "WOAT351",
                      style: CustomTextStyle.heading5.copyWith(
                        color: AppColors.nutralBlack2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    r"$500.00",
                    style: CustomTextStyle.heading5.copyWith(
                      color: AppColors.nutralBlack1,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              SizedBox(height: 6.h),
              Text(
                "25 Jan 2024",
                style: CustomTextStyle.heading5.copyWith(
                  color: AppColors.nutralBlack2,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                "1621 Ocean Pearl Rd Corolla, North Carolina (NC), 27927",
                style: CustomTextStyle.heading5.copyWith(
                  color: AppColors.nutralBlack2,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(
                thickness: 1,
                color: AppColors.greyStrokColor,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(4.r)),
                    child: Image.asset(
                      Assets.images.png.worker.keyName,
                      height: 40.h,
                      width: 50.w,
                    ),
                  ),
                  SizedBox(width: 8.r),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(4.r)),
                    child: Image.asset(
                      Assets.images.png.worker.keyName,
                      height: 40.h,
                      width: 50.w,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
