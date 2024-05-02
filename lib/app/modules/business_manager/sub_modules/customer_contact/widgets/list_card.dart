import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/business_manager/models/customer_contact_model.dart';

import 'package:nuforce/app/utils/colors.dart';

class ListCard extends StatelessWidget {
  final CustomerContactModel mainModel;
  const ListCard({
    required this.mainModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 10.w, right: 18.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.white3, width: 1.w),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primaryBlue1,
                  radius: 20.r,
                  child: Text(
                    // mainModel.mobile.toString().substring(0, 2),
                    get2DigitString(mainModel.mobile),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
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
                        color: AppColors.nutralBlack1,
                      ),
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
                        color: AppColors.nutralBlack2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.nutralBlack2,
          ),
        ],
      ),
    );
  }
}

String get2DigitString(String? value) {
  if (value == null || value.isEmpty) {
    return '00';
  } else if (value.length == 1) {
    return '0$value';
  } else {
    return value.substring(0, 2);
  }
}
