import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
class RoundedButton extends StatelessWidget {
  final String status;
  const RoundedButton({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return status=="Cancelled"?Container(
      padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 12.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r),
      color:AppColors.statusCanceldBg,

      ),child: Text('Cancelled',   style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      fontFamily: "Poppins",
      color: AppColors.red,),),
    ): status=="Overdue"?Container(
      padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 12.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r),
        color:AppColors.statusOverDuedBg,

      ),child: Text('Overdue',   style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      fontFamily: "Poppins",
      color: AppColors.blue,),),
    ):Container(
      padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 12.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r),
        color:AppColors.statusPendingBg,

      ),child: Text('Pending',   style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      fontFamily: "Poppins",
      color: AppColors.darkYellow,),),
    );
  }
}
