import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/settings/sub_modules/route_suggestions/widgets/route_insert_bottomsheet.dart';
import 'package:nuforce/app/utils/colors.dart';

import '../../../../../utils/text_styles.dart';
import '../../expense/widgets/expense_view_bottomsheet.dart';

class LocationCard extends StatelessWidget {
   LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border(
          left: BorderSide(
            color: AppColors.primaryBlue1,
            width: 4.w,
          ),
          top: BorderSide(
            color: AppColors.primaryBlue1,
            width: 1.w,
          ),
          bottom: BorderSide(
            color: AppColors.primaryBlue1,
            width: 1.w,
          ),
          right: BorderSide(
            color: AppColors.primaryBlue1,
            width: 1.w,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "John Williamson",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      fontFamily: "Poppins",
                      color: AppColors.nutralBlack1,),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "505 Carlton Pointe Dr #90Palmetto, Georgia(GA), 30268",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      fontFamily: "Poppins",
                      color: AppColors.nutralBlack2,),
                ),
              ],
            ),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => popupMenuItems,
            onSelected: (value) {
              if(value==1){
                showCupertinoModalPopup<void>(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => const InsertRouteBttomSheet(),
                );
              }
            },
          ),        ],
      ),
    );
  }  List<PopupMenuEntry<int>> popupMenuItems = [
    PopupMenuItem<int>(
      value: 1,
      child: Text(
        'Insert at this point',
        style: CustomTextStyle.paragraphExtraSmall.copyWith(
          color: AppColors.subText,
        ),
      ),
    ),
    PopupMenuItem<int>(
      value: 2,
      child: Text(
        'Remove from route',
        style: CustomTextStyle.paragraphExtraSmall.copyWith(
          color: AppColors.subText,
        ),
      ),
    ),

  ];

}
