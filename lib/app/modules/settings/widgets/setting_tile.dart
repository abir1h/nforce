import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class SettingTile extends StatelessWidget {
  final String leading;
  final String? label;
  final Widget? action;
  final bool? hasDivider;
  final VoidCallback? onTap;
  const SettingTile({
    required this.leading,
    super.key,
    this.label,
    this.action,
    this.hasDivider,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 1.sw,
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        leading,
                        height: 24.r,
                        width: 24.r,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        label ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: isIpad ? 12.sp : 16.sp,
                          color: AppColors.nutralBlack1,
                        ),
                      ),
                    ],
                  ),
                ),
                if (action != null)
                  action!
                else
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.nutralBlack2,
                  ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            if (hasDivider == true)
              const Divider(
                color: AppColors.white3,
                thickness: 1,
              )
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}
