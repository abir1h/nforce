import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.primaryBlue1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.white1,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(Assets.images.png.profilePlaceholderMale.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Abu Bokkor',
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
                            'Khadimpara, Sylhet',
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
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
