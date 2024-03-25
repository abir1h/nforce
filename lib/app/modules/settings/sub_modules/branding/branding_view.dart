import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nuforce/app/modules/settings/sub_modules/branding/branding_edit_view.dart';
import 'package:nuforce/app/shared/widgets/primary_button.dart';
import 'package:nuforce/app/utils/colors.dart';
import 'package:nuforce/gen/assets.gen.dart';

import '../../../../shared/widgets/custom_appbar_minimal.dart';

class BrandingView extends StatelessWidget {
  const BrandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white1,
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppbarMinimal(
        title: 'Branding',
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
        child: PrimaryButton(
          onPressed: () {
            Get.to<void>(() => const BrandingEditView());
          },
          text: "Edit",
          primaryColored: true,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //region persona
            Text(
              "Persona",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Image",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.nutralBlack2,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  image: AssetImage(Assets.images.png.profileAvatar.keyName),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Agent Name",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.nutralBlack2,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "John Williams",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Greetings",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.nutralBlack2,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Hello, tongue massa at suspendisse porttitor enim aliquet eget sed. Ipsum dignissim risus feugiat enim odio.",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.nutralBlack2,
              ),
            ),
            //endregion

            //region brand info
            SizedBox(
              height: 24.h,
            ),
            Text(
              "Brand Information",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Logo",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.nutralBlack2,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  image: AssetImage(Assets.images.png.brandImage.keyName),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Brand Slogan",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.nutralBlack2,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Risus in scelerisque dignissim",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: AppColors.nutralBlack1,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Brand Color",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.nutralBlack2,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "#0154A4",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: AppColors.primaryBlue1,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            //endregion
          ],
        ),
      ),
    );
  }
}
