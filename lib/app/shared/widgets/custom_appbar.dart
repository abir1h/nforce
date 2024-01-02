import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/global_states.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AppState>(
        builder: (controller) {
          return Container(
            color: AppColors.primaryBlue1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 40.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: controller.user?.photoUrl != null
                            ? CachedNetworkImage(
                                imageUrl: controller.user!.photoUrl!,
                                placeholder: (context, url) => const CircularProgressIndicator.adaptive(),
                                errorWidget: (context, url, error) => Image.asset(Assets.images.png.profilePlaceholderMale.path),
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
                          )
                        ],
                      ),
                    ],
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
