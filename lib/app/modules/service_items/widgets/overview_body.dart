import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/modules/service_items/widgets/little_text_with_colored_bg.dart';
import 'package:nuforce/app/modules/service_items/widgets/rating_tile.dart';
import 'package:nuforce/app/modules/service_items/widgets/total_reviwe_card.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/gen/assets.gen.dart';
import 'package:nuforce/main.dart';

Widget overviewBody({
  required bool isFavorite,
  required void Function() onTapFavorite,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170.sp,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.images.png.acHydrowash.path),
                fit: BoxFit.fitWidth,
              ),
              // color: AppColors.primaryBlue3,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const LittleTextWithColoredBG(
                text: '0',
                color: AppColors.primaryBlue2,
              ),
              SizedBox(width: 4.sp),
              const LittleTextWithColoredBG(
                text: 'Service',
                color: AppColors.primaryBlue1,
              ),
              SizedBox(width: 4.sp),
              const LittleTextWithColoredBG(
                text: 'IBO4',
                color: AppColors.primaryBlue2,
              ),
              const Spacer(),
              GestureDetector(
                onTap: onTapFavorite,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.primaryBlue1,
                  size: isIpad ? 30 : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Stat from',
                style: CustomTextStyle.paragraphSmall.copyWith(
                  color: AppColors.nutralBlack2,
                ),
              ),
              Text(
                'Quantity',
                textAlign: TextAlign.right,
                style: CustomTextStyle.paragraphSmall.copyWith(
                  color: AppColors.nutralBlack2,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                r'$25.00',
                style: CustomTextStyle.paragraphMedium.copyWith(
                  color: AppColors.nutralBlack1,
                ),
              ),
              Text(
                '1',
                style: CustomTextStyle.paragraphMedium.copyWith(
                  color: AppColors.nutralBlack1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category',
                style: CustomTextStyle.heading5.copyWith(
                  color: AppColors.nutralBlack1,
                ),
              ),
              Text(
                'Taxable',
                textAlign: TextAlign.right,
                style: CustomTextStyle.heading5.copyWith(
                  color: AppColors.nutralBlack1,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lawn Services',
                style: CustomTextStyle.heading4.copyWith(
                  color: AppColors.nutralBlack1,
                ),
              ),
              Text(
                'No',
                textAlign: TextAlign.right,
                style: CustomTextStyle.heading4.copyWith(
                  color: AppColors.nutralBlack1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: AppColors.inactiveColor),
          const SizedBox(height: 16),
          Text(
            'What’s Included?',
            style: CustomTextStyle.heading4.copyWith(
              color: AppColors.nutralBlack1,
            ),
          ),
          Text(
            ' • Only Service Charge\n • 7 Days service warranty',
            style: CustomTextStyle.heading5.copyWith(
              color: AppColors.nutralBlack2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Why Choose Us?',
            style: CustomTextStyle.heading4.copyWith(
              color: AppColors.nutralBlack1,
            ),
          ),
          Text(
            'Your happiness is our goal. Lorem Ipsum is sim ply dummy text of the printing and typese tting industry. Lorem Ipsum has .',
            style: CustomTextStyle.heading5.copyWith(
              color: AppColors.nutralBlack2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Customer Reviews',
            style: CustomTextStyle.heading4.copyWith(
              color: AppColors.nutralBlack1,
            ),
          ),
          const SizedBox(height: 16),
          const TotalReviewCard(),
          Text(
            'Total 22 reviews',
            textAlign: TextAlign.center,
            style: CustomTextStyle.heading5.copyWith(
              color: AppColors.nutralBlack1,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: RatingTile(),
              );
            },
          ),
        ],
      ),
    ),
  );
}
