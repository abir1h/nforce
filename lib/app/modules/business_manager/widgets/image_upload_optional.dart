import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

class ImageUploadOptional extends StatelessWidget {
  const ImageUploadOptional({
    required this.ontap,
    this.onImageRemoveButtonTap,
    this.image,
    super.key,
  });

  final VoidCallback ontap;
  final VoidCallback? onImageRemoveButtonTap;
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image != null
            ? Stack(
                children: [
                  Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: FileImage(
                          File(image!.path),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: onImageRemoveButtonTap,
                      child: Container(
                        width: 20.w,
                        height: 20.w,
                        decoration: BoxDecoration(
                          color: AppColors.white1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 12,
                          color: AppColors.primaryBlue1,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : SvgPicture.asset(
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
                  vertical: 6,
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
