import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/main.dart';

class CustomAppbarMinimal extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbarMinimal({
    required this.title,
    super.key,
    this.centerTitle = true,
    this.trailing,
    this.leadingPressed,
    this.subTitle,
    this.showBackButton = true,
  });
  final String title;
  final String? subTitle;
  final bool centerTitle;
  final List<Widget>? trailing;
  final VoidCallback? leadingPressed;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white1,
      centerTitle: centerTitle,
      title: title == ''
          ? null
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subTitle != null)
                  Text(
                    subTitle!,
                    style: TextStyle(
                      color: AppColors.nutralBlack2,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
              ],
            ),
      elevation: 0,
      leading: showBackButton
          ? IconButton(
              onPressed: () {
                if (leadingPressed != null) {
                  leadingPressed!();
                } else {
                  Get.back<void>();
                }
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.nutralBlack1,
                size: isIpad ? 30 : null,
              ),
            )
          : const SizedBox(),
      actions: trailing,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (isIpad ? 50 : 0));
}
