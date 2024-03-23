import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../../../../../utils/colors.dart';

class UserProgressCard extends StatefulWidget {
  const UserProgressCard({super.key});

  @override
  State<UserProgressCard> createState() => _UserProgressCardState();
}

class _UserProgressCardState extends State<UserProgressCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Stack(
        children: [
          Container(
            width: 1.sw,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4.r)),
                  child: Image.asset(Assets.images.png.worker.keyName),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Anna Strong',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            fontFamily: 'Poppins',
                            color: AppColors.nutralBlack1),
                      ),
                      Text(
                        'Visual Designer, Google Inc.',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                            color: AppColors.nutralBlack2),
                      ),
                      SizedBox(
                        height: 16.w,
                      ),
                      SizedBox(
                          height: 6.h,
                          width: 1.sw,
                          child: const LinearProgressIndicator(
                            color: AppColors.primaryBlue1,
                            backgroundColor: AppColors.textFieldBackground,
                            value: .65,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '65%',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                fontFamily: 'Poppins',
                                color: AppColors.nutralBlack2),
                          ),
                          Text(
                            'London',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                fontFamily: 'Poppins',
                                color: AppColors.nutralBlack2),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              right: 8.w,
              top: 8.h,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.primaryBlue1,
                ),
                child: Center(
                  child: Text(
                    "Follow",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        fontFamily: 'Poppins',
                        color: AppColors.white1),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
