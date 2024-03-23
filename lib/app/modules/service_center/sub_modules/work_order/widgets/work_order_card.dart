import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../../../../../../gen/assets.gen.dart';
import '../../../../settings/widgets/text_card.dart';

class WorkOrderCard extends StatelessWidget {
  const WorkOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 16.h),
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: AppColors.white1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Aaron Taylor",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: "Poppins",
                      color: AppColors.nutralBlack1),
                )),
                TextCard(
                  buttonText: "Pending",
                  bgColor: AppColors.lightYellow2,
                  textColor: AppColors.darkYellow,
                )
              ],
            ),SizedBox(height: 6.h,),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "WOAT351",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      fontFamily: "Poppins",
                      color: AppColors.nutralBlack2),
                )),
                Text(
                  r"$500.00",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      fontFamily: "Poppins",
                      color: AppColors.nutralBlack1),
                )
              ],
            ),SizedBox(height: 6.h,),Text(
              "25 Jan 2024",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  fontFamily: "Poppins",
                  color: AppColors.nutralBlack2),
            ),SizedBox(height: 6.h,),Text(
              "1621 Ocean Pearl Rd Corolla, North Carolina (NC), 27927",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  fontFamily: "Poppins",
                  color: AppColors.nutralBlack2),
            ),
            Divider(thickness: 1,color: AppColors.greyStrokColor,),
            Row(
              children: [
                ClipRRect(

                  borderRadius: BorderRadius.all(Radius.circular(4.r)),
                  child: Image.asset(Assets.images.png.worker.keyName,height:40,width: 50 ,),
                ),SizedBox(width: 8.r,),ClipRRect(

                  borderRadius: BorderRadius.all(Radius.circular(4.r)),
                  child: Image.asset(Assets.images.png.worker.keyName,height:40,width: 50 ,),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
