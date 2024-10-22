import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/service_items/models/service_manager_data_model.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class AddonItemCard extends StatelessWidget {
  const AddonItemCard({
    required this.onTap,
    required this.onInstallTap,
    super.key, this.data,
  });

  final VoidCallback onTap;
  final VoidCallback onInstallTap;
  final ServiceMangerItemModel? data;

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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90.sp,
                  width: 90.sp,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue3,
                    borderRadius: BorderRadius.circular(4.sp),
                    image: DecorationImage(image: AssetImage(Assets.images.png.worker.keyName),fit: BoxFit.contain),
                  ),
                ),
                SizedBox(width: 12.sp),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data!.name,
                        style: TextStyle(
                          color: AppColors.nutralBlack1,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        data!.description,
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
                            '\$${data!.totalCost}',
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: onInstallTap,
                        child: Container(
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
