import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';

class CustomAppbarMinimal extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbarMinimal({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.trailing,
  });
  final String title;
  final bool centerTitle;
  final List<Widget>? trailing;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white1,
      centerTitle: centerTitle,
      title: title == ''
          ? null
          : Text(
              title,
              style: TextStyle(
                color: AppColors.nutralBlack1,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.nutralBlack1,
        ),
      ),
      actions: trailing,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
