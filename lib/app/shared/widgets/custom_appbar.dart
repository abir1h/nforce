import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/app_states.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? leadingOnPressed;
  const CustomAppBar({
    super.key,
    this.leadingOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AppState>(
        builder: (controller) {
          return ColoredBox(
            color: AppColors.primaryBlue1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: leadingOnPressed,
                    child: Row(
                      children: [
                        Container(
                          height: 40.h,
                          width: 40.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: controller.user?.photoUrl != null
                              ? Image.network(
                                  controller.user!.photoUrl!,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(Assets.images.png.profilePlaceholderMale.path);
                                  },
                                )
                              : const CircularProgressIndicator.adaptive(backgroundColor: AppColors.white3),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.user?.displayName ?? '',
                              style: CustomTextStyle.paragraphLarge.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.white1,
                              ),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(Assets.images.svg.pinLocation),
                                const SizedBox(width: 5),
                                Text(
                                  // 'Khadimpara, Sylhet',
                                  controller.user?.businessName ?? '',
                                  style: CustomTextStyle.paragraphExtraSmall.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(Assets.images.svg.notification),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (isIpad ? 60 : 10));
}
