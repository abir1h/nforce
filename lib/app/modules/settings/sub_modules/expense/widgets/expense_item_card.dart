import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class ExpenseItemCard extends StatelessWidget {
  const ExpenseItemCard({
    required this.onTap,
    required this.onInstallTap,
    super.key,
  });

  final VoidCallback onTap;
  final VoidCallback onInstallTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),
          border: Border.all(
            color: AppColors.primaryBlue3,
          ),
        ),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue3,
                      borderRadius: BorderRadius.circular(4.sp),
                      image: DecorationImage(
                        image: AssetImage(Assets.images.png.worker.keyName),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.sp),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // Ensure column size matches content
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Electricity Bill',
                            style: TextStyle(
                              color: AppColors.nutralBlack1,
                              fontSize: 14.sp,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Payable amount Receipt. Important Notice:All Payment Done by Cheque should be in the name of Account Officer',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.nutralBlack2,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Jan 05, 2024 - 10:30 PM',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.nutralBlack2,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            r'$20,000.00',
                            style: TextStyle(
                              color: AppColors.nutralBlack1,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: onInstallTap,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 1.sp,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.green,
                              ),
                              child: Text(
                                'Approved',
                                style: TextStyle(
                                  color: AppColors.white1,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
