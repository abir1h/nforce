import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/service_items/widgets/little_text_with_colored_bg.dart';
import 'package:nuforce/app/utils/colors.dart';

class BottomTileWidget extends StatelessWidget {
  const BottomTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 5.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.sp),
        color: AppColors.textFieldBackground,
      ),
      child: Row(
        children: [
          const LittleTextWithColoredBG(
            text: 'Service',
            color: AppColors.primaryBlue1,
          ),
          SizedBox(width: 8.sp),
          Text(
            'Exhaust clean up ',
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Text(
            '\$7.00',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: AppColors.nutralBlack1,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
