import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/business_manager/models/customer_contact_model.dart';

import '../../../../../utils/colors.dart';
class ListCard extends StatelessWidget {
  final CustomerContactModel mainModel;
  const ListCard({super.key, required this.mainModel});

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.only(
          top: 12.h, bottom: 12.h, left: 10.w, right: 18.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.white3, width: 1.w)),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primaryBlue1,
                  radius: 20.r,
                  child: Text(
                    mainModel.mobile.toString().substring(0,2),
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        fontFamily: "Poppins",
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainModel.name!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          fontFamily: "Poppins",
                          color: AppColors.nutralBlack1),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      mainModel.mobile!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          fontFamily: "Poppins",
                          color: AppColors.nutralBlack2),
                    )
                  ],
                )
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.nutralBlack2,
          )
        ],
      ),
    );
  }
}
