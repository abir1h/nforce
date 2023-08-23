import 'package:flutter/material.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/app/utils/text_styles.dart';

class CompanyImage extends StatelessWidget {
  const CompanyImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: AppColors.green.withOpacity(0.3),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Company Logo ',
                    style: CustomTextStyle.paragraphSmall.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.nutralBlack1,
                    ),
                  ),
                  TextSpan(
                    text: '(optional)',
                    style: CustomTextStyle.paragraphExtraSmall.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.nutralBlack1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.lightButtonColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  'Choose file',
                  style: CustomTextStyle.paragraphExtraSmall.copyWith(
                    color: AppColors.primaryBlue1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
