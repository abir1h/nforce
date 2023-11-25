import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class ImageUploadOptional extends StatelessWidget {
  const ImageUploadOptional({
    required this.ontap,
    super.key,
  });

  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.images.svg.pickImage,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Image',
                  style: TextStyle(
                    color: AppColors.nutralBlack1,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  '(optional)',
                  style: TextStyle(
                    color: AppColors.nutralBlack2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: ontap,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue3,
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                ),
                child: Text(
                  'Choose file',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryBlue1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
