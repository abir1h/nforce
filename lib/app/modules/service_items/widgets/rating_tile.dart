import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';
import 'package:nuforce/main.dart';

class RatingTile extends StatelessWidget {
  const RatingTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.inactiveColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryBlue1,
                ),
                child: Center(
                  child: Text(
                    'AK',
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.heading5.copyWith(
                      color: AppColors.white1,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Abdul Korim',
                          style: CustomTextStyle.paragraphLarge.copyWith(
                            color: AppColors.nutralBlack1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '5, June 2023',
                          textAlign: TextAlign.right,
                          style: CustomTextStyle.paragraphExtraSmall.copyWith(
                            color: AppColors.nutralBlack2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      allowHalfRating: true,
                      itemSize: 14.sp,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star_rounded,
                        color: AppColors.yellow,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Nibh nibh quis dolor in. Etiam cras nisi, turpis quisque diam',
            style: CustomTextStyle.paragraphSmall.copyWith(
              color: AppColors.nutralBlack1,
              letterSpacing: -0.15,
            ),
          ),
          FittedBox(
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.lightBlue,
              ),
              child: Center(
                child: Text(
                  'Approve',
                  style: TextStyle(
                    color: AppColors.primaryBlue1,
                    fontSize: isIpad ? 10.sp : 14.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
