import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';

class AddonItemCard extends StatelessWidget {
  const AddonItemCard({
    super.key,
    required this.onTap,
    required this.onInstallTap,
  });

  final VoidCallback onTap;
  final VoidCallback onInstallTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        border: Border.all(
          color: AppColors.primaryBlue3,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90.sp,
                width: 90.sp,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue3,
                  borderRadius: BorderRadius.circular(4.sp),
                ),
              ),
              SizedBox(width: 12.sp),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'QuickBooks Customer Sync',
                      style: TextStyle(
                        color: AppColors.nutralBlack1,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Sync your quick books customers with nuforce contacts',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.nutralBlack1,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$250.00',
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 4.sp),
                        Text(
                          'One time fee',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColors.nutralBlack1,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 1.sp, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.primaryBlue1,
                      ),
                      child: Text(
                        'Install',
                        style: TextStyle(
                          color: AppColors.white1,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
