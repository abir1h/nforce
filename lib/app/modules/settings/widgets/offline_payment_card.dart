import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/settings/widgets/choose_button.dart';
import 'package:nuforce/app/modules/settings/widgets/roundbutton.dart';
import 'package:nuforce/app/utils/colors.dart';

class OfflinePaymentCard extends StatelessWidget {
  const OfflinePaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.greyText),
      ),
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '+123 456 7890',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              fontFamily: "Poppins",
              color: AppColors.nutralBlack1,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Payment Date',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        fontFamily: "Poppins",
                        color: AppColors.nutralBlack2,
                      ),
                    ),
                    Text(
                      '20 Jun, 2023',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: "Poppins",
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                  ],
                ),
              ),SizedBox(width: 20.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pay method',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        fontFamily: "Poppins",
                        color: AppColors.nutralBlack2,
                      ),
                    ),
                    Text(
                      'Bank',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: "Poppins",
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                  ],
                ),
              ),SizedBox(width: 20.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Work order ID',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        fontFamily: "Poppins",
                        color: AppColors.nutralBlack2,
                      ),
                    ),
                    Text(
                      'Ascn2541',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        fontFamily: "Poppins",
                        color: AppColors.nutralBlack1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  '\$10,000.00',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    fontFamily: "Poppins",
                    color: AppColors.nutralBlack1,
                  ),
                ),
              ),
              RoundedButton(
                status: "Cancelled",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
